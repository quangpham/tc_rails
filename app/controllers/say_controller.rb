class SayController < ApplicationController
  def hello
    client = LinkedIn::Client.new
    client.authorize_from_access(current_user.linkedin_authentication.token, current_user.linkedin_authentication.secret)
    #raise client.profile.to_yaml
    @search_results = client.search(:keywords => "Activeark").people.all
    #raise @search_results.to_yaml
    
    @company_search_results = client.search({ :keywords => "Activeark"}, "company").companies.all
    #raise @company_search_results.to_yaml
    
    @com_data = client.company(:id => 2393260, :fields => %w{ id name email-domains industry logo-url specialties description locations:(address:(city state country-code) is-headquarters) employee-count-range })
    # current_user.companies.create(:linkedin_id => com_data.id, :name => com_data.name, :description => com_data.description)
    # raise @com_data.to_yaml
  end

  def goodbye
  end
end
