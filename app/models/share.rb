class Share < ActiveRecord::Base
  attr_accessible :description, :title, :image, :user_id, :image_remote_url

validates :title, presence: true, length: {maximum: 200}
validates :description, presence: true, length: {maximum: 4000}
validates :user_id, presence: true
validates_attachment :image, presence: true,
						content_type: {content_type: ['image/jpeg', 'image/jpg','image/png','image/gif']},
						size: {less_than: 5.megabytes}

belongs_to :user
has_attached_file :image, styles: {medium: "320x240>"}
  

  def image_remote_url=(url_value)
self.image = URI.parse(url_value) unless url_value.blank?
  	super
  end
end
