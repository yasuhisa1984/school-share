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
    email = Faker::Internet.email
    password = ENV['SEED_USER_PASSWORD']
    user = User.create!(
      email: email,
      password: password,
      password_confirmation: password
    )
}

#スクール
5.times {
  name = ['プログラミングスクールA','プログラミングスクールB','ITスクールC','ITスクールD','パソコンスクールE'].sample
  url = Faker::Internet.url
  description = Faker::Hacker.say_something_smart
  school_image_url = 'gakkou.png'
  remote = [true,false].sample

  School.create!(
    name: "#{name}",
    url: "#{url}",
    description: "#{description}",
    school_image_url: "#{school_image_url}",
    remote: "#{remote}",
  )
}

#ポスト
5.times {
  work = ['ポートフォリオurl1','ポートフォリオurl2'].sample
  story = ['仕事で役立ちました。','憧れのアプリを製作しました。'].sample

  Post.create!(
    work: "#{work}",
    story: "#{story}"
  )
}

#アドレス
5.times {
  name = Faker::Address.state + Faker::Address.city + Faker::Address.street_address
  postalcode = Faker::Address.zip_code
  area = ['関東地方','中部地方','北海道/東北地方','近畿地方','四国地方',
          '中国地方','九州／沖縄地方','全国対応(オンライン)'].sample

  Address.create!(
    name: "#{name}",
    postalcode: "#{postalcode}",
    area: "#{area}",
    school_id: School.ids.first
  )
}
