FactoryBot.define do
  factory :user do
    email { "test@example.com" }
    password { "jklhfdsauilfheukalnfj" }
    password_confirmation { "jklhfdsauilfheukalnfj" }

    factory :admin do
      after(:create) { |user| user.add_role :admin }
    end
  end
end
