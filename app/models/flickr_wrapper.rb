class FlickrWrapper

  root_url = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=b178c161bae74b7d8bc33f64fb23d15a&tags=samueljackson&format=json&nojsoncallback=1&auth_token=72157650158570684-2d02f6fbe64018be&api_sig=8d6a434987d62c3cbeabd38446c82169"

  def self.search_for_jackson
    response = HTTParty.get(root_url)
    response 
  end


end