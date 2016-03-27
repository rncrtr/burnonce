class EmailsController < ApplicationController

  def index
    #user messages protect with devise
    #create another method called burn_it which updates the email address for the user
  end

  def burn_it
    current_user.burn_email
    redirect_to emails_path, notice: "You now have a new email address, enjoy it for the day!"
  end
end
