class CreateSubscriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :subscriptions do |t|
      t.belongs_to :user
      t.belongs_to :followee, class: "User"
      t.timestamps
    end
  end
end
