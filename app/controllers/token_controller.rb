class TokenController < ApplicationController
  def get_token
    info = InformationToConnect.first
    client_id = info.client_id
    client_secret = info.client_secret
    code = info.code
    puts(client_id, client_secret, code)
    begin
      #response = RestClient.get 'https://api.instagram.com/oauth/authorize/?client_id=24626bd21aa74c0f8af7d7e41b992323&redirect_uri=http://localhost:3000/information_to_connects&response_type=code'
      params_to_access_token = { client_id: client_id,
                 client_secret: client_secret,
                 grant_type: 'authorization_code',
                 redirect_uri: 'http://localhost:3000/information_to_connects',
                 code: code }
      json ||= JSON.parse(RestClient.post 'https://api.instagram.com/oauth/access_token', params_to_access_token)
      access_token = json['access_token']
      puts(access_token)
      if info.update_attribute(:access_token, access_token)
        redirect_to information_to_connects_path
      else
        redirect_to information_to_connects_path, notice: 'Произошла неведомая ошибка!'
      end
    rescue => e
      redirect_to information_to_connects_path, notice: "Ошибка: #{e.response}"
    end
  end
end



