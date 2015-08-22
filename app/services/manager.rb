class Manager

  def Manager.start
    stock = Stock.first
    tag = URI.encode(stock.hashtag)
    info = InformationToConnect.first

    if stock !=nil
      if stock.is_valid
        Members.search(tag, info.access_token)
      else

      end
    end
  end

end