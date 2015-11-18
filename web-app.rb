require 'sinatra'
require './download-data'
require './parse-file'

set :static, true
set :public_folder, File.dirname(__FILE__) + '/static'
set :views, "views"

get '/' do
  
  erb :index

end


get '/internal/' do

  download_internal_best_bets

  erb :list, :locals => {
    'title' => 'Internal', 
    'filename' => 'data/best-bets-internal.txt'
  }

end


get '/external/' do

  download_external_best_bets
  title = "External"

   erb :list, :locals => {
    'title' => 'External',
    'filename' => 'data/best-bets-external.txt'
  }

end
