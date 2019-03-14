# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_190_314_013_337) do
  create_table 'users', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: :cascade do |t|
    t.string 'email', null: false, comment: 'メールアドレス'
    t.boolean 'email_publish', default: false, null: false, comment: 'メールアドレスを公開'
    t.string 'family_name', null: false, comment: '姓'
    t.string 'given_name', null: false, comment: '名'
    t.boolean 'name_publish', default: false, null: false, comment: '氏名を公開'
    t.string 'nickname', null: false, comment: 'ニックネーム'
    t.integer 'gender_id', null: false, comment: '性別'
    t.date 'birthday', null: false, comment: '誕生日'
    t.boolean 'date_publish', default: true, null: false, comment: '誕生日を公開'
    t.boolean 'age_publish', default: true, null: false, comment: '年齢を公開'
    t.integer 'role_id', default: 2, null: false, comment: '所属'
    t.string 'twitter', comment: 'twitterアカウント'
    t.string 'musical_instrument', comment: '担当楽器'
    t.text 'comment', comment: 'コメント'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['twitter'], name: 'index_users_on_twitter', unique: true
  end
end
