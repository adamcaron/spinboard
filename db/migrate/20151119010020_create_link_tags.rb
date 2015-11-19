class CreateLinkTags < ActiveRecord::Migration
  def change
    create_table :link_tags do |t|
      t.references :links
      t.references :tags

      t.timestamps null: false
    end
  end
end
