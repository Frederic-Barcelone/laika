class PregnanciesController < PatientChildrenController

  def edit
  end

  def update
    @patient.update_attributes params[:patient]
    render :partial  => 'show'
  end
  
  def destroy
    @patient.update_attributes(:pregnant => nil)
    render :partial  => 'show'
  end

end
