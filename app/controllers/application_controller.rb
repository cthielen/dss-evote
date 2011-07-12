class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter CASClient::Frameworks::Rails::Filter
  before_filter :login_required
  
  def login_required
    if session[:cas_user]
      begin
        @@user = Person.find(session[:cas_user])
        return true
      rescue Exception => e
        # User not found
        @@user = nil
      end
    end
    
    flash[:warning] = 'You must authenticate with CAS to continue'
    session[:return_to] = request.request_uri
    
    redirect_to :controller => "site", :action => "index"
    
    return false 
  end
end
