class Pledge < ActiveRecord::Base
  belongs_to :project

  AMOUNT = [25, 50, 100, 200, 500]

  validates :name, presence: true
  validates :email, allow_blank: false, format: {
    with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
    message: 'must enter a valid email'
  }
  validates :amount, inclusion: {in: AMOUNT}
end
