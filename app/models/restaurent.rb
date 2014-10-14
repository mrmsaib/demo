class Restaurent < ActiveRecord::Base
  mount_uploader :image, ImageUploader
end
