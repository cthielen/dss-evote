# Load the rails application
require File.expand_path('../application', __FILE__)

require 'casclient'
require 'casclient/frameworks/rails/filter'

# Initialize the rails application
DssEvote::Application.initialize!

# Remove or change this if you don't use UC Davis CAS authentication
CASClient::Frameworks::Rails::Filter.configure(
  :cas_base_url => "https://cas.ucdavis.edu/cas/"
)
