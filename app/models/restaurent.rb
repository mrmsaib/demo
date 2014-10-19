class Restaurent < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  has_many :reviews
  validates :name, :image, presence: true
  validates :phone, format: {
    with: /\A\(\d{3}\) \d{3}- \d{4}\z/,
    message: "must be in the format (123) 456- 7890"}    
  validates :website, format: { with: /\Ahttps?:\/\/.*\z/,
    message: "must start with http:// or https://" }
  validates :address, format: { with: /\A\d+[^,]+,[^,]+, [A-Z]{2} \d{5}\z/,
      message: "must be in the format 2355 St-marc, Montreal, QC 10118" }
end
