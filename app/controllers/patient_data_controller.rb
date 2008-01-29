class PatientDataController < ApplicationController

  def index
    @patient_data_list = PatientData.find(:all, :conditions => {:vendor_test_plan_id => nil})
    @vendors = Vendor.find(:all)
  end

  def create
    @patient_data = PatientData.new(params[:patient_data])
    @patient_data.save!
    redirect_to :controller => 'patient_data', :action => 'show', :id => @patient_data.id
  end
  
  def show
    @patient_data = PatientData.find(params[:id])
  end

  def patient_story
    @patient_data = PatientData.find(params[:id])
  end
  
  def patient_xml
    @patient_data = PatientData.find(params[:id])
  end
end