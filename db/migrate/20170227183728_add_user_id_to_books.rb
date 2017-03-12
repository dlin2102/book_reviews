class AddUserIdToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :user_id, :integer
    # If you wanted to more specifically designate this as a foreign key:
    # add_reference :books, :user, foreign_key: true
  end
end
