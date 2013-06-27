class Share < ActiveRecord::Base
  attr_accessible :description, :title
validates :title, presence: true, length: {maximum: 200}
  validates :description, presence: true, length: {maximum: 4000}

  belongs_to :user
  validates :user_id, presence: true
end
