require 'rest_client'
require 'pp'

class SubredditBrowser

  def get
    response = RestClient.get 'http://reddit.com/subreddits/popular.json?limit=10'
    raw_hash = JSON.parse(response.to_str)

    pp raw_hash

    return nil

  end



end