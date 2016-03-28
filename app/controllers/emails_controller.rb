class EmailsController < ApplicationController

  def index
    @emails = current_user.emails.order("created_at DESC")
  end

  def show
    @email = Email.find(params[:id])
  end

  # def burn_it
  #   current_user.burn_email
  #   redirect_to emails_path, notice: "You now have a new email address, enjoy it for the day!"
  # end
end
