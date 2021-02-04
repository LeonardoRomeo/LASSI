class Post < ApplicationRecord
  validates_presence_of :title, :information
  belongs_to :student
  has_many :answers
end
