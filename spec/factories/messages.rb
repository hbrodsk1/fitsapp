FactoryGirl.define do
  factory :message do
    body "MyText"
    recipient 2
    client
  end

  factory :invalid_message, class: Message do
    body ""
    recipient 2
    client
  end
end
