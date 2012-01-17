class Post < ActiveRecord::Base

  col :title
  timestamps

  belongs_to :author

end

Post.auto_upgrade!