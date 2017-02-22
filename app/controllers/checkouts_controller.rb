class CheckoutsController < ApplicationController
  def stripe_checkout
  	  @amount = $pilgrim.package.price*3
	  #This will create a charge with stripe for $10
	  #Save this charge in your DB for future reference
	  if params[:stripeToken]
		  charge = Stripe::Charge.create(
		                  :amount => @amount * 100,
		                  :currency => "inr",
		                  :source => params[:stripeToken],
		                  :description => "Test Charge"
		  )
		  flash[:notice] = "Successfully created a charge"
		  redirect_to '/'
	 end
  end
end
