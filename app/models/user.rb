class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :rooms
  has_many :reservations
       

  mount_uploader :icon, ImageUploader #追記 iconカラムにアップローダーを紐づけてますよという内容

  validates :name, on: :create, presence: true #追記空白はだめ
  validates :profile, length: { maximum: 200 } #追記


  
end
