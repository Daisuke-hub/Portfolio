# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Region.create(id: "1", region_name: "北海道")
Region.create(id: "2", region_name: "東北")
Region.create(id: "3", region_name: "関東")
Region.create(id: "4", region_name: "中部")
Region.create(id: "5", region_name: "近畿")
Region.create(id: "6", region_name: "中国")
Region.create(id: "7", region_name: "四国")
Region.create(id: "8", region_name: "九州")
Region.create(id: "9", region_name: "沖縄")

Prefecture.create(region_id: "1", prefecture_name: "北海道")
Prefecture.create(region_id: "2", prefecture_name: "青森")
Prefecture.create(region_id: "2", prefecture_name: "秋田")
Prefecture.create(region_id: "2", prefecture_name: "岩手")
Prefecture.create(region_id: "2", prefecture_name: "山形")
Prefecture.create(region_id: "2", prefecture_name: "宮城")
Prefecture.create(region_id: "2", prefecture_name: "福島")
Prefecture.create(region_id: "3", prefecture_name: "群馬")
Prefecture.create(region_id: "3", prefecture_name: "栃木")
Prefecture.create(region_id: "3", prefecture_name: "茨城")
Prefecture.create(region_id: "3", prefecture_name: "埼玉")
Prefecture.create(region_id: "3", prefecture_name: "東京")
Prefecture.create(region_id: "3", prefecture_name: "神奈川")
Prefecture.create(region_id: "3", prefecture_name: "千葉")
Prefecture.create(region_id: "4", prefecture_name: "新潟")
Prefecture.create(region_id: "4", prefecture_name: "富山")
Prefecture.create(region_id: "4", prefecture_name: "石川")
Prefecture.create(region_id: "4", prefecture_name: "福井")
Prefecture.create(region_id: "4", prefecture_name: "長野")
Prefecture.create(region_id: "4", prefecture_name: "山梨")
Prefecture.create(region_id: "4", prefecture_name: "岐阜")
Prefecture.create(region_id: "4", prefecture_name: "静岡")
Prefecture.create(region_id: "4", prefecture_name: "愛知")
Prefecture.create(region_id: "5", prefecture_name: "三重")
Prefecture.create(region_id: "5", prefecture_name: "滋賀")
Prefecture.create(region_id: "5", prefecture_name: "京都")
Prefecture.create(region_id: "5", prefecture_name: "大阪")
Prefecture.create(region_id: "5", prefecture_name: "兵庫")
Prefecture.create(region_id: "5", prefecture_name: "奈良")
Prefecture.create(region_id: "5", prefecture_name: "和歌山")
Prefecture.create(region_id: "6", prefecture_name: "鳥取")
Prefecture.create(region_id: "6", prefecture_name: "島根")
Prefecture.create(region_id: "6", prefecture_name: "岡山")
Prefecture.create(region_id: "6", prefecture_name: "広島")
Prefecture.create(region_id: "6", prefecture_name: "山口")
Prefecture.create(region_id: "7", prefecture_name: "徳島")
Prefecture.create(region_id: "7", prefecture_name: "香川")
Prefecture.create(region_id: "7", prefecture_name: "愛媛")
Prefecture.create(region_id: "7", prefecture_name: "高知")
Prefecture.create(region_id: "8", prefecture_name: "福岡")
Prefecture.create(region_id: "8", prefecture_name: "佐賀")
Prefecture.create(region_id: "8", prefecture_name: "長崎")
Prefecture.create(region_id: "8", prefecture_name: "熊本")
Prefecture.create(region_id: "8", prefecture_name: "大分")
Prefecture.create(region_id: "8", prefecture_name: "宮崎")
Prefecture.create(region_id: "8", prefecture_name: "鹿児島")
Prefecture.create(region_id: "9", prefecture_name: "沖縄")

Genre.create(genre_name: "ロック")
Genre.create(genre_name: "ハードロック")
Genre.create(genre_name: "メタル")
Genre.create(genre_name: "ポップ")
Genre.create(genre_name: "アニソン")
Genre.create(genre_name: "ボカロ")
Genre.create(genre_name: "ブルース")
Genre.create(genre_name: "ジャズ")
Genre.create(genre_name: "ボサノバ")
Genre.create(genre_name: "カントリー")
Genre.create(genre_name: "ゴスペル")
Genre.create(genre_name: "ビジュアル系")
Genre.create(genre_name: "弾き語り")
Genre.create(genre_name: "セッション")
Genre.create(genre_name: "カバー")
Genre.create(genre_name: "オリジナル")

require "csv"
CSV.foreach('db/user.csv', headers: true) do |row|
  User.create(
    email: row['email'],
    name: row['name'],
    sex: row['sex'],
    age: row['age'],
    instrument: row['instrument'],
    region: row['region'],
    introduction: row['introduction'],
    level: row['level'],
    chat_flag: row['chat_flag'],
    password: row['password']
  )
end

# require "csv"
# CSV.foreach('db/genre_relationship.csv', headers: true) do |row|
#   Genre_relationship.create(
#     user_id: row['user_id'],
#     room_id: row['room_id'],
#   )
# end





















