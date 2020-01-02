class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.string :title, null: false
      t.string :src, null: false
      t.string :content_type, null: false
      t.string :poster_src, null:false
      t.string :views, null:false
    
      t.timestamps
    end
  end
end
