class ChangeLinkIdAndTagId < ActiveRecord::Migration
  def change
    remove_column :link_tags, :links_id
    remove_column :link_tags, :tags_id

    add_column :link_tags, :link_id, :integer
    add_column :link_tags, :tag_id, :integer
  end
end
