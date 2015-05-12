class CheckoutController < ApplicationController
  def checkout
	@devices = Device.sorted
  end
end
