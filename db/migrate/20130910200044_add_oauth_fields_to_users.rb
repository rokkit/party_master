class AddOauthFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :token, :string
    add_column :users, :username, :string
    add_column :users, :provider, :string
    add_column :users, :authentication_token, :string
  end
end
