class ListingOwnership < ActiveRecord::Base

  belongs_to :user

  validates_numericality_of :display_per_page
  validates_inclusion_of :view_aspect, { :in => ['hot', 'new', 'rising', 'top'] }

  scope :ordered, lambda { order('listing_ownerships.position ASC') }


  acts_as_list scope: :user  

end
