class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  #facebookとgoogle_oauth2の２つを定義
  def facebook
    callback_from :facebook
  end

  def google_oauth2
    callback_from :google
  end

  private

  def callback_from(provider)
    provider = provider.to_s #プロバイダを定義 
    @user = User.from_omniauth(request.env['omniauth.auth']) #モデルでSNSにリクエストするメソッド（from_omniauth）を使用し、レスポンスを@userに代入
    if @user.persisted? #@userがDBに保存されていたらログイン処理、存在しなかったら残りの登録処理へ移行
      sign_in @user
      redirect_to root_path
    else
      #新規登録の記述
      #今回は複数ページに渡る登録項目があるため、情報をsessionに保存し、他のページにも持ち越せるように
      #この辺りの値は用途に合わせてアレンジしてください。
      session[:password] = @user.password
      session[:password_confirmation] = @user.password
      session[:provider] = @user.provider
      session[:uid] = @user.uid
      #redirect_toだと別contorollerを介するので、インスタンス変数が使えない。よってrender templateを使う
      render template:'signup/step1'
    end
  end

end