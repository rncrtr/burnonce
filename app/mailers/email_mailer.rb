class EmailMailer < ApplicationMailer
  default from: "no-reply@burnonce.com"

  def notify(email)
    @email = Email.find(email.id)
    mail to: [@email.user.email] ,subject: "#{@email.user.username} You have a new message!"
  end

  def new_or_reply(email)
    @email = Email.find(email.id)
    mail to: [@email.to_email], from: [@email.from_email], subject: "#{@email.subject}"
  end
end
