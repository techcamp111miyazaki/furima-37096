FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name {"苗字"}
    first_name {"名前"}
    last_name_reading {"ミョウジ"}
    first_name_reading {"ナマエ"}
    birthday {Faker::Date.between(from: 5.days.ago, to: Date.today)}
  end
end