class Newspaper < ActiveRecord::Base
  attr_accessible :editor, :title

  validates :title, presence: true, uniqueness: true
end
