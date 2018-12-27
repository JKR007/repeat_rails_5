class AdminUser < ApplicationRecord
  # We altered the 'User' table to 'AdminUser'
  # in order to rails convention works correctly we have to say the 'table_name'
  # self.table_name = "admin_users"
  # or change the 'class' name and 'file' name

  # to use 'has_and_belongs_to_many, we create migration 'create_admin_user_pages_join'
  has_and_belongs_to_many :pages

  
  has_many :section_edits
  has_many :sections, through: :section_edits

end
