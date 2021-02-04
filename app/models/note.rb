class Note < ApplicationRecord

  validates_presence_of :nome , :argument , :pdf

  belongs_to :student

  has_one_attached :pdf

end
