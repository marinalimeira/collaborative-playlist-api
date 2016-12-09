FactoryGirl.define do
  factory :user do
    name                  "Anakin Skywalker"
    email                 "darthvader@galacticempire.com"
    password              "palpatine"
    password_confirmation "palpatine"
  end
end
