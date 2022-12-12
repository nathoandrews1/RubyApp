# frozen_string_literal: true

# This file is the source Rails uses to define your schema when running `bin/rails
ActiveRecord::Schema[7.0].define(version: 20_221_212_180_725) do
  create_table 'cars', force: :cascade do |t|
    t.string 'brand'
    t.string 'model'
    t.string 'engine'
    t.float 'mpg'
    t.float 'price'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'status'
  end

  create_table 'reviews', force: :cascade do |t|
    t.string 'username'
    t.text 'reviewbody'
    t.integer 'car_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'status'
    t.integer 'user_id', null: false
    t.integer 'rating'
    t.index ['car_id'], name: 'index_reviews_on_car_id'
    t.index ['user_id'], name: 'index_reviews_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'name'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'reviews', 'cars'
  add_foreign_key 'reviews', 'users'
end
