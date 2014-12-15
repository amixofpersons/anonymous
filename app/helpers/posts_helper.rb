module PostsHelper
  def recent_posts
    today = DateTime.now.mjd
    Post.order("created_at DESC").select{|post| (today - post.created_at.to_date.mjd <= 7)}
  end
end