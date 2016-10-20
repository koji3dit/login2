class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :addresses
  validates :stuff_code, presence: true
  validates :user_id, presence: true
end
