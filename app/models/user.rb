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

class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :role,
             class_name: Role.name,
             shortcuts: [:name]
  belongs_to :gender,
             class_name: Gender.name,
             shortcuts: [:name]


  #scope
  scope :twitter_like, -> (twitter){
    where('twitter LIKE ?', "%#{twitter}%")
  }
  scope :nickname_like, -> (nickname){
    where('nickname LIKE ?', "%#{nickname}%")
  }
  scope :comment_like, -> (comment){
    where('comment LIKE ?', "%#{comment}%")
  }
  scope :keyword_like, -> (keyword){
    twitter_like(keyword)
      .or(nickname_like(keyword))
      .or(comment_like(keyword))
  }

  #method
  def display_email
    email_publish ? email : ''
  end

  def display_name
    name_publish ? "#{family_name} #{given_name}" : ''
  end

  def display_birthday
    base = [age_publish ? birthday.year : '']
    base << birthday.month if date_publish
    base << birthday.day if date_publish
    base.join('/')
  end
end
