class Link < ActiveRecord::Base
  validates :title, presence: true
  validates :url, presence: true, url: true

  belongs_to :user

  def status
    if self.read
      "Read"
    else
      "Unread"
    end
  end
end
