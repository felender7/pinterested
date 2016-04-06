class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         has_many :pins, dependent: :destroy
         has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" },
         :storage => :dropbox,
         :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
         :dropbox_options => {:path => proc { |style| "#{style}/#{id}_#{avatar.original_filename}"} }
         validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
