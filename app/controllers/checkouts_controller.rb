class CheckoutsController < ApplicationController
  def stripe_checkout
  	if !params[:stripeToken]
  	  	@data = Pilgrim.find params[:id]
	    @amount = (@data.copilgrims.count + 1) * @data.package.price
	    @email = @data.email
	  #This will create a charge with stripe for $10
	  #Save this charge in your DB for future reference
	else
		
		  charge = Stripe::Charge.create(
		                  :amount => @amount,
		                  :currency => "inr",
		                  :source => params[:stripeToken],
		                  :description => "Test Charge"
		  )
		  flash[:notice] = "Successfully created a charge"
		  redirect_to '/'
	 end
  end
end
