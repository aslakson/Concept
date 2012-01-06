class CreateOrganizationUsers < ActiveRecord::Migration  
  def up
    create_table :organization_users do |t|
      t.references :organization, :user, :role
    end
    add_index(:organization_users, [:organization_id, :user_id, :role_id], :unique => true, :name => 'org_user_role')
  end

  def down
    drop_table :organization_users
  end
end