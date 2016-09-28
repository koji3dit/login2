class Profile < ActiveRecord::Base
  belongs_to :user
  validates :stuff_code, presence: true
  validates :user_id, presence: true
end
