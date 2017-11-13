FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@example.com" }
    password { Faker::Crypto.md5 }
    password_confirmation { password }

    factory :admin do
      after(:create) { |user| user.add_role :admin }
    end
  end
end
