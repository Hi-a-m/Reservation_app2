class Room < ApplicationRecord

        belongs_to :user, optional: true
        has_many :reservations_path
        
        mount_uploader :image, ImageUploader

        validates :room_name, presence: true
        validates :image, presence: true
        validates :price, presence: true
        validates :address, presence: true
        validates :introduction, presence: true
        
      


        def self.search(search)
          if search != ""
            Room.where(['room_name LIKE(?) OR introduction LIKE(?) OR address LIKE(?)', "%#{search}%", "%#{search}%", "%#{search}%"])
          else
            Room.all
          end
        end
        #if search != ""とすることで、検索フォームに何か値が入力されていた場合を条件としている。

end
