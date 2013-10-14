class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer 'viewpoint_id', default: 0, null: false
      t.integer 'post_id', null: false
      t.integer 'number', null: false
      t.text    'body', null: false
      t.timestamps
    end

    add_index 'comments', :post_id
    add_index 'comments', :viewpoint_id
  end
end
