class Post < ApplicationRecord
  has_many :comments


  def spamFind(post)
    post.title = "SPAM"

  end

end
