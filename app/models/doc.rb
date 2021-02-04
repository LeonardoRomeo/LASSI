class Doc < ApplicationRecord
  
  validates_presence_of :name, :argument, :pdf

  belongs_to :student

  has_one_attached :pdf
end
