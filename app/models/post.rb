class Post < ActiveRecord::Base
  has_and_belongs_to_many :rubrics
  has_many :cmmnts
  validates :title, presence: true, length: {minimum: 5}
  validates :body, presence: true

end
