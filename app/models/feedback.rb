class Feedback < ActiveRecord::Base

  validates :name, :contact, :message, presence: true
end
