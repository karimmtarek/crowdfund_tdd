module ProjectsHelper
  def format_end_date(project)
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
      image_tag project.image_file_name, width: 640, height: 360
    end
  end

  def image_for_index(project)
    if project.image_file_name.blank?
      image_tag 'blank-320x180.gif'
    else
      image_tag project.image_file_name, width: 320, height: 180
    end
  end
end
