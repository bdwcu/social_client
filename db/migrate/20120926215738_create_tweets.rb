class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :user
      t.string :tweet
      t.integer :user_id
      t.timestamps
    end
  end
end
