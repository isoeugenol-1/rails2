class RemoveBlogimageFromBlogs < ActiveRecord::Migration[5.1]
  def change
    remove_column :blogs, :blogimage, :text
  end
end
