class Answer < ActiveRecord::Base

  validates_presence_of :comment

  belongs_to :student
  belongs_to :post
end
