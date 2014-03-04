require 'spec_helper'


describe 'feed/default.html.erb' do

  def assign_page_dependencies(user_id)
    session[:user_id] = user_id
    listingOwnership = ListingOwnership.find(User.find(user_id).default_listing_ownership_id)
    @lvp = ListingViewPreparer.new(listingOwnership, params)
    @page_menu = Menu.find_by_identifier_string('default')
  end

  context 'when demo user is logged in' do
    before(:each) do
      assign_page_dependencies(1)
    end

    it 'displays the default feed header' do
      render
      rendered.should have_selector('h1', :content => 'My Default Feed (Reddit Front Page)')
    end

    it 'displays a link to the next page' do
      render
      rendered.should have_selector('a', :content => 'Next')
    end
  end

end