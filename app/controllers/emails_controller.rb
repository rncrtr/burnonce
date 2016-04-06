class EmailsController < ApplicationController
  respond_to :html, :js
  def index
    @emails = current_user.emails.search(params[:search]).order("created_at DESC")
  end

  def show
    @email = Email.find(params[:id])
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy
    redirect_to emails_path, notice: "Message Deleted!"
  end

  def destroy_all
    current_user.emails.delete_all
    redirect_to emails_path, notice: "All Messages Clear"
  end


  def burn_it
     current_user.generate_burn_email
     redirect_to emails_path, notice: "You now have a new email address, enjoy it for the day!"
  end
end
