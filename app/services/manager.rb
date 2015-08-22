class Manager
  @stock ||= Stock.first
  @tag ||= URI.encode(@stock.hashtag)
  @info ||= InformationToConnect.first

  def Manager.start
    if @stock !=nil
      if @stock.is_valid
        Members.search(@tag, @info.access_token)
      else

      end
    end
  end

  def Manager.stop
    Members.search(@tag, @info.access_token)
  end

end