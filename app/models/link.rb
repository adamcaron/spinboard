class Link < ActiveRecord::Base
  validates :title, presence: true
  validates :url, presence: true, url: true

  belongs_to :user

  has_many :link_tags
  has_many :tags, through: :link_tags

  def status
    if self.read
      "Read"
    else
      "Unread"
    end
  end

  def change_status
    if self.read
      self.update!(read: false)
    else
      self.update!(read: true)
    end
  end
end
