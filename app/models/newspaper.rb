class Newspaper < ActiveRecord::Base
  attr_accessible :editor, :title

  belongs_to :user, foreign_key: :editor

  validates :title, presence: true, uniqueness: true
end
