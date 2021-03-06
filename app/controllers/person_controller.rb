class PersonController < ApplicationController
  
def index
    @persons = Person.sorted
  end

  def new
    @persons = Person.new()
  end

  def show
   @persons = Person.find(params[:id])
  end

  def create
        # Instantiate a new object using form parameters
        @persons = Person.new(person_params)
        # Save the object
        if @persons.save
          # If save succeeds, redirect to the index action
          flash[:notice] = "Person created successfully."
          redirect_to(:action => 'index')
        else
          # If save fails, redisplay the form so user can fix problems
          render('new')
        end
      end 

  def edit
    @persons = Person.find(params[:id])
  end

  def update
    # Find an existing object using form parameters
    @persons = Person.find(params[:id])
    # Update the object
    if @persons.update_attributes(person_params)
      # If update succeeds, redirect to the index action
      flash[:notice] = "Person updated successfully."
      redirect_to(:action => 'show', :id => @persons.id)
    else
      # If update fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

  def delete
   @persons = Person.find(params[:id])
  end

  def destroy
    @persons = Person.find(params[:id]).destroy
    flash[:notice] = "Person destroyed successfully."
    redirect_to(:action => 'index')
  end

  private

        def person_params
         # same as using "params[:subject]", except that it:
          # - raises an error if :subject is not present
          # - allows listed attributes to be mass-assigned
          params.require(:people).permit(:first_name, :last_name, :id_no)
        end 
end
