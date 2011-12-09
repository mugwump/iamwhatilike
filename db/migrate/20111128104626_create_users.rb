class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name

      t.string :account_id

      t.timestamps
    end
  end
end
