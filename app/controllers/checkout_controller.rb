class CheckoutController < ApplicationController
  def checkout
	@devices = Device.available
  end

  def update 
   # Find an existing object using form parameters
    @devices = Device.find(params[:id])
    # Update the object
    if @devices.update_attributes(:available => false)
      # If update succeeds, redirect to the index action
      flash[:notice] = "Device updated successfully."
      redirect_to(:action => 'select_person', :id => @devices.id)
    else
      # If update fails, redisplay the form so user can fix problems
      render('index')
    end

   end

  def select_person
     @devices = Device.find(params[:id])
     @persons = Person.sorted
   
  end

  def select_date
     @devices = Device.find(params[:id])
  end

  def update_dates
     @devices = Device.find(params[:id])
     if @devices.update_attributes(dates_params)
      # If update succeeds, redirect to the index action
      flash[:notice] = "Device updated successfully."
      render('index')
      else
         render('index')
      end
  end


  def update_renter
      @devices = Device.find(params[:id])
      @persons = Person.find(params[:p_id])

      if @devices.update_attributes(:person_rented_id_no => @persons.id_no)
      # If update succeeds, redirect to the index action
      flash[:notice] = "Device updated successfully."
      redirect_to(:action => 'select_date' , :id => @devices.id)
    else
      # If update fails, redisplay the form so user can fix problems
      render('index')
    end
  end

  def checkin
     @devices = Device.not_available
  end

  def checkin_device 
   # Find an existing object using form parameters
    @devices = Device.find(params[:id])
    # Update the object
    if @devices.update_attributes(:available => true, :day_checked_out => "", :day_due => "", :person_rented_id_no => nil)
      # If update succeeds, redirect to the index action
      flash[:notice] = "Device updated successfully."
      render('index')
    else
      # If update fails, redisplay the form so user can fix problems
      render('index')
    end

   end



  
   private

        def dates_params
         # same as using "params[:subject]", except that it:
          # - raises an error if :subject is not present
          # - allows listed attributes to be mass-assigned
          params.require(:devices).permit(:day_checked_out, :day_due)
        end 
  
      

end
