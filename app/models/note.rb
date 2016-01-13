class Note < ActiveRecord::Base
  validates :title, :description, presence: true
  validates :description, length: { :minimum => 10}
  belongs_to :user

  has_many :attachments, dependent: :destroy
  accepts_nested_attributes_for :attachments, reject_if: :all_blank
  self.per_page = 5
end
