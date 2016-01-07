class Note < ActiveRecord::Base
  validates :title, :description, presence: true
  validates :description, length: { :minimum => 10}
  belongs_to :user
end
