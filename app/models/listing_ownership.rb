class ListingOwnership < ActiveRecord::Base

  validates_numericality_of :display_per_page
  validates_inclusion_of :view_aspect, { :in => ['hot', 'new', 'rising', 'top'] }

end
