class Members
  if Stock.first !=nil
    @stock ||= Stock.first
    @start_date ||=Time.parse(@stock.start_date).to_i
    @expiration_date ||= "#{@stock.expiration_date} #{@stock.expiration_time}".to_time.to_i
  end
  # Поиск участников по тегу указанному в акции
  def Members.search(tag, access_token)
    puts 'Дата начало'
    puts @start_date
    puts 'Дата окончания'
    puts @expiration_date
    json ||= JSON.parse(RestClient.get "https://api.instagram.com/v1/tags/#{tag}/media/recent?access_token=#{access_token}")
    # todo проверка если значение не возвращаются
    puts json
    json['data'].each do |user|
      publication_date = user['created_time']
      if publication_date.to_i < @start_date
        puts "не соответствует условию"
        return
      end
      puts("Идет поиск участников: #{user['user']['username']} Дата публикации: #{publication_date}")
      if publication_date.to_i <= @expiration_date
        add_member(user['user']['full_name'],
                   user['user']['username'],
                   user['likes']['count'],
                   user['created_time'],
                   user['images']['standard_resolution']['url'])
      end
    end
    members_from_next_url(json['pagination']['next_url'])
  end

  # Поиск участников в следующей ссылки указанной пир первом запросе
  def Members.members_from_next_url(next_url)
    if next_url != nil
      next_url_json ||= JSON.parse(RestClient.get next_url)
      # todo проверка если значение не возвращаются
      next_url_json['data'].each do |user|

        publication_date = user['created_time']
        if publication_date.to_i < @start_date
          return
        end
        puts("Идет поиск участников: #{user['user']['username']} Дата публикации: #{publication_date}")
        if publication_date.to_i <= @expiration_date
          add_member(user['user']['full_name'],
                     user['user']['username'],
                     user['likes']['count'],
                     user['created_time'],
                     user['images']['standard_resolution']['url'])
        end
      end
      members_from_next_url(next_url_json['pagination']['next_url'])
    end
  end

  def Members.add_member(name, nickname, likes, publication_date, photo_url)
    member = Member.find_by(nickname: nickname, publication_date: publication_date)
    stock ||= Stock.first

    if member
      puts "#{nickname} есть в базе"
      member.update(likes: likes)
    else
      puts "#{nickname} создан в базе"
      Member.create(name: name, nickname: nickname, likes: likes, publication_date: publication_date, photo_url: photo_url)
    end

  end
end