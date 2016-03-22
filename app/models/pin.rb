class Pin < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_presence :image ,presence: true
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates :description, length: { minimum: 2 },presence: true
end
