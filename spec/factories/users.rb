FactoryGirl.define do
   pw = RandomData.random_sentence
   factory :user do
     name RandomData.random_name
     sequence(:email){|n| RandomData.random_word + "user#{n}@factory.com" }
     password pw
     password_confirmation pw
     role :member
   end
 end
