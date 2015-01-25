class FeedbacksController < ApplicationController

  def create
    @feedback = Feedback.new(feedback_params)

    respond_to do |format|
      if @feedback.save
        format.html {
          flash[:notice] = t('views.feedback.notice')
          render :show, layout: !request.xhr?
        }
        format.json { render :show, status: :created }
      else
        format.html { render :new }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def feedback_params
    params.require(:feedback).permit(:name, :message, :contact, :ip, :referrer)
  end
end
