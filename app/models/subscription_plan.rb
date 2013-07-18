class SubscriptionPlan < ActiveRecord::Base
  attr_accessible :is_weekly, :newspaper_id, :price

  belongs_to :newspaper
  has_many :subscriptions
  has_many :users, through: :subscriptions

  validates :price, presence: true
  validates_inclusion_of :is_weekly, :in => [true, false]
end