class EmailsController < ApplicationController
  respond_to :html, :js
  def index
    @emails = current_user.emails.search(params[:search]).order("created_at DESC")
  end

  def show
    @email = current_user.emails.find(params[:id])
  end

  def new
    @email = current_user.emails.new
  end
  def create
        @email = current_user.emails.new(email_params)
        respond_to do |format|
          if @email.save
            EmailMailer.new_or_reply(@email).deliver_now
            format.html { redirect_to emails_path, notice: "Awesome #{current_user.username} your email has been sent!" }
            format.json { render action: 'show', status: :created, location: @email }
          else
            format.html { render action: 'reply' }
            format.json { render json: @email.errors, status: :unprocessable_entity }
          end
        end
      end

  def reply
    original_email = current_user.emails.find(params[:id])
    @email = Email.new(
      user_id: original_email.user_id,
      from_email: original_email.to_email,
      to_email: original_email.from_email,
      subject: original_email.subject,
      body: original_email.body
    )
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
     redirect_to emails_path, notice: "You now have a new email address, enjoy it while it lasts!"
  end

private
  def email_params
    params.require(:email).permit(:from_email, :to_email, :subject, :body, :user_id)
  end
end
