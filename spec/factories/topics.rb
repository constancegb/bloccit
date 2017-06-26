#Defines a new factory for topics generating a topic with random name & description.
FactoryGirl.define do
   factory :topic do
     name RandomData.random_name
     description RandomData.random_sentence
   end
 end
