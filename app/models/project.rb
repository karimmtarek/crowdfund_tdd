class Project < ActiveRecord::Base
  has_many :pledges, dependent: :destroy

  validates :name, :description, presence: true
  validates :description, length: {maximum: 500}
  validates :target_pledge_amount, numericality: {greater_than: 0}
  validates :website, allow_blank: false, format: {
    with: URI::regexp,
    message: 'must enter a valid website address'
  }
  validates :image_file_name, allow_blank: true, format: {
    with: /\w+\.(gif|jpg|png)\z/i,
    message: "must refrence a GIF, JPG, or PNG image"
  }

  def done?
    Time.now > pledging_ends_on
  end

  def self.active_pledging
    where('pledging_ends_on > ?', Time.now).order('pledging_ends_on')
  end
end