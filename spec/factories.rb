FactoryGirl.define do
  factory :user do
   # name     "Michael Hartl"
    email    "1111@126.com"
    password "111111"
    password_confirmation "111111"
    id "11"
  end

  factory :post do
    # name     "Michael Hartl"
    title    "1111@126.com"
    place "111111"
   details "ddd"
    id "11"
  end
end