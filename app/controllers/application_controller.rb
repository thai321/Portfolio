class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include DeviseWhitelist
  include SetSource # set source to session, so that we say hi to anyone with Fb or twitter 
  include CurrentUserConcern # User class type || OpenStruct class type
  include DefaultPageContent
end
