module ProjectsHelper
  def format_pledging_ends_on(project)
    if project.done?
      content_tag(:strong, 'All Done!')
    else
      project.pledging_ends_on
    end
  end

  def image_for(project)
    if project.image_file_name.blank?
      image_tag 'blank.gif'
    else
      image_tag project.image_file_name
    end
  end
end
