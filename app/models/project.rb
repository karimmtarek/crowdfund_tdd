class Project < ActiveRecord::Base
  def done?
    Time.now > pledging_ends_on
  end

  def self.active_pledging
    where('pledging_ends_on > ?', Time.now).order('pledging_ends_on')
  end
end