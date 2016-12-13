FactoryGirl.define do
  factory :video do
    url   "http://www.google.com"
    user  { build :user }
  end
end
