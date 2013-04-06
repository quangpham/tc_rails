class SayController < ApplicationController
  def hello
    client = LinkedIn::Client.new
    client.authorize_from_access(current_user.linkedin_authentication.token, current_user.linkedin_authentication.secret)
    #raise client.profile.to_yaml
    @search_results = client.search(:keywords => "Activeark").people.all
    #raise @search_results.to_yaml
    
    @company_search_results = client.search({ :keywords => "Activeark"}, "company").companies.all
    #raise @company_search_results.to_yaml
  end

  def goodbye
  end
end
