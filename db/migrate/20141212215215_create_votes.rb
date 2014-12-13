class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :vote
      t.integer :user_id
      # can use the commented out code in the next line or the 2 lines below it to achieve the same thing
      #t.references :voteable, polymorphic: true
      t.string :voteable_type
      t.integer :voteable_id
      t.timestamps
    end
  end
end
