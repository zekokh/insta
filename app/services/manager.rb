class Manager
  if Stock.first !=nil
    @stock = Stock.first
    @tag = URI.encode(@stock.hashtag)
    @info ||= InformationToConnect.first
  end

  def Manager.start
    if @stock !=nil
      if @stock.is_valid
        Members.search(@tag, @info.access_token)
      else
        @flag = true # флаг что бы запускать метод поиска участников один раз (что бы сохранялось количество лайков)
        if @flag #todo велосипед переписать
          Members.search(@tag, @info.access_token)
          @flag = false
        end
      end
    end
  end
  def Manager.stop
    Members.search(@tag, @info.access_token)
  end
end