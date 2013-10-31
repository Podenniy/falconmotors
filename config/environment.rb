# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Falconmotors::Application.initialize!

ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => ENV['Dima'],
  :password       => ENV['123'],
  :domain         => 'heroku.com',
  :enable_starttls_auto => true
}

#end