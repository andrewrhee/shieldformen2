class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  private

	  def current_cart
	  	Cart.find(session[:cart_id])
	  rescue ActiveRecord::RecordNotFound
	  	cart = Cart.create
	  	session[:cart_id] = cart.id
	  	cart
	  end

	  def signed_in_user
	    unless signed_in?
	      store_location
	      redirect_to signin_url, notice: "Please sign in."
	    end
	  end

	  def correct_user
	    @user = User.find(params[:id])
	    redirect_to(root_path) unless current_user?(@user)
	  end

end
