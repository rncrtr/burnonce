class ChargesController < ApplicationController
  skip_before_filter :authenticate_user!

  def new
  end

  def create
    # Amount in cents
     @amount = 500

     customer = Stripe::Customer.create(
       :email => params[:stripeEmail],
       :source  => params[:stripeToken]
     )

     charge = Stripe::Charge.create(
       :customer    => customer.id,
       :amount      => @amount,
       :description => 'Burnonce.com Donation',
       :currency    => 'usd'
     )

    rescue Stripe::CardError => e
     flash[:error] = e.message
     redirect_to new_charge_path
 end
end
