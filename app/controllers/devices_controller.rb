class DevicesController < ApplicationController
  def index
    @devices = Device.sorted
  end

  def new
    @devices = Device.new({:serial_no => "00000", :available => true})
  end

  def show
   @devices = Device.find(params[:id])
  end

  def create
        # Instantiate a new object using form parameters
        @devices = Device.new(device_params)
        
        # Save the object
        if @devices.save
          # If save succeeds, redirect to the index action
          flash[:notice] = "Device created successfully."
          redirect_to(:action => 'index')
        else
          # If save fails, redisplay the form so user can fix problems
          render('new')
        end
      end 

  def edit
    @devices = Device.find(params[:id])
  end

  def update
    # Find an existing object using form parameters
    @devices = Device.find(params[:id])
    # Update the object
    if @devices.update_attributes(device_params)
      # If update succeeds, redirect to the index action
      flash[:notice] = "Device updated successfully."
      redirect_to(:action => 'show', :id => @devices.id)
    else
      # If update fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

  def delete
   @devices = Device.find(params[:id])
  end

  def destroy
    @devices = Device.find(params[:id]).destroy
    flash[:notice] = "Device destroyed successfully."
    redirect_to(:action => 'index')
  end

  private

        def device_params
         # same as using "params[:subject]", except that it:
          # - raises an error if :subject is not present
          # - allows listed attributes to be mass-assigned
          params.require(:devices).permit(:serial_no, :make, :model, :available, :day_checked_out, :day_due, :person_rented_id_no)
        end 
  

end
