class Subreddit

  attr_accessor :title, :display_name, :base_url, :description_text, :title_description, :nsfw

  def initialize(subreddit_hash)

    subreddit_hash = subreddit_hash['data']

    @title = subreddit_hash['title']
    @display_name = subreddit_hash['display_name']
    @base_url = 'http://reddit.com' + subreddit_hash['url']
    @description_text = subreddit_hash['description']
    @nsfw = subreddit_hash['over18']
    @title_description = @display_name + ' ----- ' + @title + ''

  end

end