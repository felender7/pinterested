class Pin < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" },
  :storage => :dropbox,
  :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
  :dropbox_options => {:path => proc { |style| "#{style}/#{id}_#{image.original_filename}"} }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
