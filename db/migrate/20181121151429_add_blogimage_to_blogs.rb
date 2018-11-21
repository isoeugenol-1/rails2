class AddBlogimageToBlogs < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :blogimage, :text
  end
end
