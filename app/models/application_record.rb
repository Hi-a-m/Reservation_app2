class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  



end

#対応するデータベースのテーブルを用意しない場合は、
#self.abstract_class = true を書く必要があります。