# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!
require 'flickraw-cached'

FlickRaw.api_key=ENV['flickr_api_key']
FlickRaw.shared_secret=ENV['flickr_shared_secret']