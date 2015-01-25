class FeedbackMailer < ActionMailer::Base

  def notification(feedback)
    @feedback = feedback
    mail(to: 'rc@ifoxy.net', subject: 'Новая заявка')
  end
end