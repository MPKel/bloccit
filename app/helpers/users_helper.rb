module UsersHelper
  def has_votes_or_comments?
    @user.posts.count > 0 || @user.comments.count > 0
  end
end
