class CompaniesController < ApplicationController
  # GET /companies
  # GET /companies.json
  
  before_filter :authenticate_user!, except: [:index]
  
  def index
    @companies = current_user.companies if user_signed_in?
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @companies }
    end
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    @company = Company.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @company }
    end
  end

  # GET /companies/new
  # GET /companies/new.json
  def new
    unless params[:lid].empty?
      client = LinkedIn::Client.new
      client.authorize_from_access(current_user.linkedin_authentication.token, current_user.linkedin_authentication.secret)
      com_data = client.company(:id => params[:lid], :fields => %w{ id name email-domains website-url industry logo-url specialties description locations:(address:(city state country-code) is-headquarters) employee-count-range })
      #raise com_data.to_yaml
      @company = Company.new(:description => com_data.description, :name => com_data.name, :linkedin_id =>com_data.id, :industry => com_data.industry, :website => com_data["website-url"])
    else
      @company = Company.new
    end
    

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @company }
    end
  end

  # GET /companies/1/edit
  def edit
    @company = Company.find(params[:id])
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(params[:company])
    @company['user_id'] = current_user.id

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render json: @company, status: :created, location: @company }
      else
        format.html { render action: "new" }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /companies/1
  # PUT /companies/1.json
  def update
    @company = Company.find(params[:id])

    respond_to do |format|
      if @company.update_attributes(params[:company])
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company = Company.find(params[:id])
    @company.destroy

    respond_to do |format|
      format.html { redirect_to companies_url }
      format.json { head :no_content }
    end
  end
  
  def search_from_linkedin
      client = LinkedIn::Client.new
      client.authorize_from_access(current_user.linkedin_authentication.token, current_user.linkedin_authentication.secret)
      
      @company_search_results = client.search({ :keywords => [params[:company_name]]}, "company").companies.all
      #@com_data = client.company(:id => @company_search_results.first.id, :fields => %w{ id name email-domains industry logo-url specialties description locations:(address:(city state country-code) is-headquarters) employee-count-range })
  end
end
