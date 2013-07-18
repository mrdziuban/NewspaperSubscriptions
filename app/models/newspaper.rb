class Newspaper < ActiveRecord::Base
  attr_accessible :editor, :title, :subscription_plans_attributes

  belongs_to :user, foreign_key: :editor
  has_many :subscription_plans, dependent: :destroy
  accepts_nested_attributes_for :subscription_plans, reject_if: :all_blank

  validates :title, presence: true, uniqueness: true
end