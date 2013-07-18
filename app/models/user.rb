class User < ActiveRecord::Base
  attr_accessible :name, :password, :password_confirmation, :subscription_plan_ids
  has_secure_password

  has_many :newspapers, foreign_key: :editor
  has_many :subscriptions, dependent: :destroy
  has_many :subscription_plans, through: :subscriptions

  validates :name, presence: true, uniqueness: true
  validates :password, presence: :true, length: {minimum: 6}, on: :create
  validates :password, confirmation: true, allow_nil: true
  validates :password_confirmation, presence: true, length: {minimum: 6}, on: :create
end