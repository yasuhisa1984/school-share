# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
Faker::Config.locale = :ja

#ユーザー
5.times {
  name = Faker::LordOfTheRings.character
  email = Faker::Internet.email
  age = Faker::Number.number(2)
  gender = ['男','女'].sample
  history = ['独学でプログラミング歴半年です。','Sierで2年間働いてました。'].sample
  future = ['IOTの開発に役立てたいです。','ITの力で人材不足を解消！'].sample
  password = ENV['SEED_USER_PASSWORD']
  user = User.create!(
    name: name,
    email: email,
    age: age,
    gender: gender,
    history: history,
    future: future,
    password: password,
    password_confirmation: password
  )
}

#スクール
5.times do |n|
  name = ['プログラミングスクールA','プログラミングスクールB','ITスクールC','ITスクールD','パソコンスクールE']
  url = Faker::Internet.url
  description = Faker::Hacker.say_something_smart
  school_image_url = 'gakkou.png'
  remote = [true,false].sample

  School.create!(
    name: "#{name[n]}",
    url: "#{url}",
    description: "#{description}",
    school_image_url: "#{school_image_url}",
    remote: "#{remote}",
  )
end

#コース
5.times do |n|
  name = ['AIコース','pythonコース','Scalaコース','Webアプリケーションコース','JavaScriptコース']
  price = Faker::Number.number(2)
  period = ['3ヶ月','6ヶ月','1年','2年','特になし'].sample

  Course.create!(
    name: "#{name[n]}",
    price: "#{price}",
    period: "#{period}",
    school_id: School.ids.first
  )
end

#ポスト
5.times {
  work = ['http://github.com','http://github.com/user'].sample
  story = ['仕事で役立ちました。','憧れのアプリを製作しました。'].sample
  Post.create!(
    work: "#{work}",
    story: "#{story}",
    user_id: User.ids.sample,
    school_id: School.ids.first,
    course_id: Course.ids.first
  )
}

#アドレス
5.times {
  name = Faker::Address.state + Faker::Address.city + Faker::Address.street_address
  postalcode = Faker::Address.zip_code
  area = ['関東地方','中部地方','北海道/東北地方','近畿地方','四国地方',
          '中国地方','九州／沖縄地方','オンライン'].sample

  Address.create!(
    name: "#{name}",
    postalcode: "#{postalcode}",
    area: "#{area}",
    school_id: School.ids.first
  )
}

#目的
5.times do |n|
  name = ['就職・転職','趣味','起業','仲間作り','その他']
  Purpose.create!(
    name: "#{name[n]}"
  )
end

#スキル
5.times do |n|
  name = ['Ruby','Github','チーム開発','Jquery','アルゴリズム','マネージメント力']
  Skill.create!(
    name: "#{name[n]}",
    post_id: Post.ids[n],
    school_id: School.ids[n]
  )
end

#スコア
5.times do |n|
  point = [*1..5]

  Score.create!(
    point: "#{point[n]}",
    skill_id: Skill.ids[n]
  )
end

#中間テーブル
5.times do |n|
  SchoolPurpose.create!(
    school_id: School.ids.first,
    purpose_id: Post.ids[n]
  )

  PostPurpose.create!(
    post_id: Post.ids.first,
    purpose_id: Purpose.ids[n]
  )
end
