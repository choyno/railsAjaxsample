class PostMailer < ActionMailer::Base
  default from: "from@example.com"

  def post
    @greeting = "Hi"

    mail(to: "jebiecorsiga@gmail.com", subject: 'Welcome to My Awesome Site')
  end

end
