# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test#{format('%05d', n)}@example.com" }
    sequence(:family_name) { |n| n.even? ? '山田' : '田中' }
    sequence(:given_name) { |n| n.even? ? "太郎#{n}" : "花子#{n}" }
    sequence(:nickname) { |n| n.even? ? "ヤマダタロウ#{n}" : "タナカハナコ#{n}" }
    sequence(:gender_id) { |n| n.even? ? Gender::MAN.id : Gender::WOMAN.id }
    birthday { Date.today }
    role_id { Role::GENERAL.id }
    sequence(:twitter) { |n| "twitter#{n}" }

    trait :admin do
      role_id { Role::ADMINISTRATOR.id }
    end
  end
end
