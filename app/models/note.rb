class Note < ActiveRecord::Base
  validates :title, :description, presence: true
  validates :description, length: { :minimum => 10}
  belongs_to :user
  self.per_page = 5
end
