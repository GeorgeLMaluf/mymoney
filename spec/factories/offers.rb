# frozen_string_literal: true

FactoryBot.define do
  factory :offer do
    advertiser_name { Faker::Name.name }
    description { Faker::Lorem.sentence }
    url { Faker::Internet.url }
    starts_at { Time.now + 2.days }
    ends_at { Time.now + 5.days }

    trait :endless do
      ends_at { nil }
    end

    trait :enabled do
      status { :enabled }
    end
  end
end
