class Tag < ActiveRecord::Base
  validates :title, presence: true

  has_many :link_tags
  has_many :links, through: :link_tags
end
