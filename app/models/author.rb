class Author < ActiveRecord::Base

  col :name, :title

  has_many :posts

end

Author.auto_upgrade!