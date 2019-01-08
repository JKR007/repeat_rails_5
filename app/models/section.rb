class Section < ApplicationRecord

  acts_as_list scope: :page

  belongs_to :page

  has_many :section_edits
  has_many :admin_users, through: :section_edits

  scope :visible, lambda { where(visible: true) }
  scope :newest_first, -> { order(position: :desc) }

  CONTENT_TYPES = ['text','HTML']

  validates_presence_of :name
  validates_length_of :name, maximum: 255
  validates :content_type,
            inclusion: {
                        in: CONTENT_TYPES,
                        message: "must be one of: #{CONTENT_TYPES.join(', ')}" 
                        }
  validates :content, presence: true


end
