class Rubric < ActiveRecord::Base
  has_and_belongs_to_many :posts, dependent: :destroy
  validates :title, presence: true, length: {minimum: 5}
end

