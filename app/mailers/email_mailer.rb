class EmailMailer < ApplicationMailer
  default from: "no-reply@burnonce.com"

  def notify(email)
    @email = Email.find(email.id)
    mail to: [@email.user.email] ,subject: "#{@email.user.username} You have a new message!"
  end
end
