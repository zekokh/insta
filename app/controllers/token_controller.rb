class TokenController < ApplicationController
  def get_token
=begin
    http = Net::HTTP.new('https://api.instagram.com')
    http.use_ssl = true

    request = Net::HTTP::Post.new('/oauth/access_token')
    request.body = {:client_id => '24626bd21aa74c0f8af7d7e41b992323', :client_secret => 'dec1fe820eff428c94d2fd4803551f04', :grant_type => 'authorization_code', :code => '944fdb3ee98c4403887f758a3877c12f'}
    response = http.request(request)
    json = JSON.parse(response)
    puts("Тут ответ")
    puts(json)
=end

    response = RestClient.post("https://api.instagram.com/oauth/access_token", nested: {client_id: "24626bd21aa74c0f8af7d7e41b992323", client_secret: "dec1fe820eff428c94d2fd4803551f04",
                               grant_type: "authorization_code", code: "12e7033d3f6045058c2805cab8dff4ae"})
    puts("тут смотри")
    puts(response.code)
  end
end
