FactoryGirl.define do
  factory :robot do
    name "Beep"
    service_date { 30.days.ago }
    inventor
    sequence :serial do |n| 
      "#{n}" 
    end

    friendly true

    trait :evil do 
      friendly false
      name "Evil Beep"
    end

  end
end