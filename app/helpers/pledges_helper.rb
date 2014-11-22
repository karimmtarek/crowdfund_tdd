module PledgesHelper
  def render_pledges(pledges)
    if pledges.any?
      render 'pledges/list'
    else
      content_tag(:p, 'No pledges yet.')
    end
  end
end