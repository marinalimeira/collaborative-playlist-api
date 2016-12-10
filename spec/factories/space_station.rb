FactoryGirl.define do
  factory :space_station do
    name  "Death Star"
    user  { build :user }
  end
end
