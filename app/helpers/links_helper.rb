module LinksHelper
  def button_text(id)
    link = Link.find(id)
    if link.read
      "Mark as Unread"
    else
      "Mark as Read"
    end
  end
end