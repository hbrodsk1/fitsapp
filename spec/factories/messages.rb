FactoryGirl.define do
  factory :message do
    body "MyText"
    recipient 1
    client nil
  end
end
