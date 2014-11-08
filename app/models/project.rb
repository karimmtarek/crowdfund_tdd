class Project < ActiveRecord::Base
  def done?
    Time.now > pledging_ends_on
  end
end
