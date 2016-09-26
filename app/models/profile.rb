class Profile < ActiveRecord::Base
  belongs_to :user
  validates :stuff_code, length: { maximum: 3 }, presence: true
end
