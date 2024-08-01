class Book < ApplicationRecord
  belongs_to :user  #has_many
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}

  def self.search_for(content, method)
    if method == 'perfect'
      Book.where("title LIKE ?", "#{content}")
    elsif method == 'forward'
      Book.where('title LIKE ?', "#{content}%")
    elsif method == 'backward'
      Book.where('title LIKE ?', "%#{content}")
    else
      Book.where('title LIKE ?', "%#{content}%")
    end
  end

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
