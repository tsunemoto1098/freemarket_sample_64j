crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", personals_path
  parent :root
end

crumb :profile do
  link "プロフィール"
  parent :mypage
end

crumb :personal do
  link "本人情報の登録"
  parent :mypage
end

crumb :log_out do
  link "ログアウト"
  parent :mypage
end


crumb :card do
  link "支払い方法"
  parent :mypage
end


crumb :item do |item|
  link "#{item.name}"
  parent :root
end

