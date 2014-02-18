class ListingItem

  attr_accessor :title, :subreddit, :link, :created, :thumbnail, :author, :nsfw

 

  # an "item" node is passed into the constructor.
  def initialize(hash)
    
    data = hash['data']

    @title = data['title']
    @subreddit = data['subreddit']
    @link = data['url']
    @created = data['created']
    @thumbnail = data['thumbnail']
    @author = data['author']
    @nsfw = data['over_18']

  end


end

  
  ## 
  # Parse out:
  #  title
  #  category
  #  link
  #  guid
  #  pubDate
  #  description
  #  [media:title]
  #  [media:thumbnail]



  # :title, :category, :link, :guid, :pubDate, :description, :mediaTitle, :mediaThumbnail

  # private

  #   def processItemChild(child)
  #     case child.node_name
  #     when 'title'
  #       @title = child.content
  #     when 'category'
  #       @category = child.content
  #     when 'link'
  #       @link = child.content
  #     when 'guid'
  #       @guid = child.content
  #     when 'pubDate'
  #       @pubDate = child.content
  #     when 'description'
  #       @description = child.content
  #     when 'mediaTitle'
  #       @mediaTitle = child.content
  #     when 'mediaThumbnail'
  #       @mediaThumbnail = child['url']
  #   end