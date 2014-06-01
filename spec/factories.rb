FactoryGirl.define do
  factory :user do
    name     "Zeb Girouard"
    email    "timzebgir@gmail.com"
    password "foobar"
    password_confirmation "foobar"
  end
end