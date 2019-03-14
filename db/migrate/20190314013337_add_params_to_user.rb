# frozen_string_literal: true

class AddParamsToUser < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.boolean :email_publish, null: false, default: false, comment: 'メールアドレスを公開'
      t.string :family_name, null: false, comment: '姓'
      t.string :given_name, null: false, comment: '名'
      t.boolean :name_publish, null: false, default: false, comment: '氏名を公開'
      t.string :nickname, null: false, comment: 'ニックネーム'
      t.integer :gender_id, null: false, comment: '性別'
      t.date :birthday, null: false, comment: '誕生日'
      t.boolean :date_publish, null: false, default: true, comment: '誕生日を公開'
      t.boolean :age_publish, null: false, default: true, comment: '年齢を公開'
      t.integer :role_id, null: false, default: Role::GENERAL.id, comment: '所属'
      t.string :twitter, comment: 'twitterアカウント'
      t.string :musical_instrument, comment: '担当楽器'
      t.text :comment, comment: 'コメント'

      t.index :email, unique: true
      t.index :twitter, unique: true

      reversible do |r|
        r.up do
          t.remove :name
          t.change :email, :string, null: false, comment: 'メールアドレス'
          t.change :created_at, :datetime, after: :comment
          t.change :updated_at, :datetime, after: :created_at
        end
        r.down do
          t.string :name, first: true
          t.change :email, :string, null: true, comment: ''
          t.change :created_at, :datetime, after: :email
          t.change :updated_at, :datetime, after: :created_at
        end
      end
    end
  end
end
