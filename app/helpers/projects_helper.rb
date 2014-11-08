module ProjectsHelper
  def format_end_date(project)
    if project.done?
      content_tag(:strong, 'All Done!')
    else
      project.pledging_ends_on
    end
  end
end
