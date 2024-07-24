class Book < ApplicationRecord
  belongs_to :user  #has_many
  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}
end
