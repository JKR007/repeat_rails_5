class Page < ApplicationRecord
  acts_as_list scope: :subject

  has_and_belongs_to_many :admin_users
  has_many :sections
  belongs_to :subject, { :optional => false } #Optional is used to not to save if Subject ID is not defined

  scope :visible, lambda { where(visible: true) }
  scope :newest_first, -> { order(position: :asc) }

  validates :name,
            presence: true,
            length: { maximum: 255 }

  validates_presence_of :permalink
  validates_length_of :permalink, within: 3..255
  validates_uniqueness_of :permalink
  
end
