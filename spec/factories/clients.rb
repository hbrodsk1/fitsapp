FactoryGirl.define do
  factory :client do
    sequence(:email) { |n| "user#{n}@example.com" }
    password "password"
    role "user"
  end

  factory :trainer, class: Client do
    sequence(:email) { |n| "trainer#{n}@example.com" }
    password "password"
    role "trainer"
  end
end
