class Newspaper < ActiveRecord::Base
  attr_accessible :editor, :title, :subscription_plans_attributes

  belongs_to :user, foreign_key: :editor
  has_many :subscription_plans
  accepts_nested_attributes_for :subscription_plans

  validates :title, presence: true, uniqueness: true
end
