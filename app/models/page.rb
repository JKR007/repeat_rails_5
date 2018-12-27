class Page < ApplicationRecord
  has_and_belongs_to_many :admin_users
  has_many :sections
  belongs_to :subject, { :optional => false } #Optional is used to not to save if Subject ID is not defined

  scope :visible, lambda {where(visible: true)}
  scope :newest_first, -> {order(position: :asc)}

end
