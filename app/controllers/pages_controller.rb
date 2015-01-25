class PagesController < ApplicationController
  def index
    @feedback = Feedback.new
    @data_type = :json
  end
end
