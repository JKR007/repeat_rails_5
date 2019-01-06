class AdminUser < ApplicationRecord
  # We altered the 'User' table to 'AdminUser'
  # in order to rails convention works correctly we have to say the 'table_name'
  # self.table_name = "admin_users"
  # or change the 'class' name and 'file' name

  has_secure_password

  # to use 'has_and_belongs_to_many, we create migration 'create_admin_user_pages_join'
  has_and_belongs_to_many :pages

  has_many :section_edits
  has_many :sections, through: :section_edits

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\Z/i
  FORBIDDEN_USERNAMES = ['Allah']
  validates :frist_name,
            presence: true,
            length: { maximum: 25 }

  validates_presence_of :last_name
  validates_length_of :last_name, maximum: 25

  validates :username,
            presence: true,
            length: { within: 8..25 },
            uniqueness: true
  # validates_uniqueness_of :username

  # validates_presence_of :email
  # validates_length_of :email, :maximum => 100
  # validates_format_of :email, :with => EMAIL_REGEX
  # validates_confirmation_of :email

  validates :email,
            presence: true,
            length: { maximum: 100 },
            format: { with: EMAIL_REGEX},
            confirmation: true

  validate :username_is_allowed
  validate :no_new_users_on_tuesday

  scope :sorted, -> { where(:full_name) }

  private

  def username_is_allowed
    if FORBIDDEN_USERNAMES.include? username
      errors.add :username, 'has been restricted from use.'
    end
  end

  def no_new_users_on_tuesday
    if Time.now.wday == 2
      errors.add :base, 'No new users on Tuesday.'
    end
  end

  def full_name
    self.frist_name + " " + self.last_name
  end
end
