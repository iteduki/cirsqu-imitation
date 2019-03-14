# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                 :bigint(8)        not null, primary key
#  email              :string(255)      not null
#  email_publish      :boolean          default(FALSE), not null
#  family_name        :string(255)      not null
#  given_name         :string(255)      not null
#  name_publish       :boolean          default(FALSE), not null
#  nickname           :string(255)      not null
#  gender_id          :integer          not null
#  birthday           :date             not null
#  date_publish       :boolean          default(TRUE), not null
#  age_publish        :boolean          default(TRUE), not null
#  role_id            :integer          default(2), not null
#  twitter            :string(255)
#  musical_instrument :string(255)
#  comment            :text(65535)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_users_on_email    (email) UNIQUE
#  index_users_on_twitter  (twitter) UNIQUE
#

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
