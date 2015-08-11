require 'restclient'
require 'json'

class HomeController < ApplicationController
  def index
    #client_id = "24626bd21aa74c0f8af7d7e41b992323"
    #client_secret = "dec1fe820eff428c94d2fd4803551f04"
    #code = params[:code]
    #tag = URI.encode('майкоп')
    #response = RestClient.post("https://api.instagram.com/oauth/access_token", client_id: client_id, client_secret: client_secret,
    #grant_type: 'authorization_code', redirect_uri: 'http://localhost:3000/signin', code: code)
    #json = JSON.parse(response)
    #puts(json)
    #puts(json['access_token'])
    #@pretty_json = JSON.pretty_generate(@json)

    #response = RestClient.post("https://api.instagram.com/oauth/authorize/?client_id=CLIENT-ID&redirect_uri=REDIRECT-URI&response_type=code")
  end

  def show
    client_id = "24626bd21aa74c0f8af7d7e41b992323"
    client_secret = "dec1fe820eff428c94d2fd4803551f04"
    code = params[:code]
    tag = URI.encode('майкоп')
    response = RestClient.post("https://api.instagram.com/oauth/access_token", client_id: client_id, client_secret: client_secret,
                               grant_type: 'authorization_code', code: code)
    json = JSON.parse(response)
    @pretty_json = JSON.pretty_generate(json)
  end

  def signin
    client_id = "24626bd21aa74c0f8af7d7e41b992323"
    client_secret = "dec1fe820eff428c94d2fd4803551f04"
    code = params[:code]
    tag = URI.encode('майкоп')
    RestClient.post("https://api.instagram.com/oauth/access_token", client_id: client_id, client_secret: client_secret,
                               grant_type: 'authorization_code', redirect_uri: 'http://localhot:3000/signin', code: code)
  end

  def get_key

  end
end
