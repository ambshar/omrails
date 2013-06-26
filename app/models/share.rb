class Share < ActiveRecord::Base
  attr_accessible :description, :title
validates :title, presence: true, length: {maximum: 200}
  validates :description, presence: true, length: {maximum: 4000}
end
