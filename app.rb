require 'rubygems'
require 'bundler'

Bundler.require

Dir.glob('./lib/*.rb') do |model|
  require model
end

class YerAGoodManApp < Sinatra::Application

  configure do
    set :root, File.dirname(__FILE__)

    Compass.configuration do |config|
      config.project_path = File.dirname(__FILE__)
      config.sass_dir = 'views'
    end

    set :haml, { :format => :html5 }
    set :sass, Compass.sass_engine_options
    set :scss, Compass.sass_engine_options
    set :public_folder, 'public'
  end

  get '/' do
    haml :index
  end

  get "/stylesheet.css" do
    scss :styles
  end

  def partial(haml_file)
    haml haml_file, :layout => false
  end
end

