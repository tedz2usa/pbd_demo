require 'spec_helper'

describe ListingViewPreparer do 
  let(:lvp) { ListingViewPreparer.new(ListingOwnership.find(1), {}) }
  let(:lvp2) { ListingViewPreparer.new(ListingOwnership.find(1), lvp.nextLinkParams) }

  context 'when pulling from the reddit front page feed, FIRST page' do
    it 'contains at least one feed listing item' do
      lvp.listingItems.size.should be > 1
    end

    it "has the title 'Reddit Front Page'" do
      lvp.title.should == 'Reddit Front Page'
    end

    it 'has a next link' do
      lvp.hasNext.should be_true
    end

    it 'does not have a previous link' do
      lvp.hasPrevious.should be_false
    end
  end

  context 'when pulling from the reddit front page feed, SECOND page' do
    it 'has a next link' do
      lvp2.hasNext.should be_true
    end

    it 'has a previous link' do
      lvp2.hasPrevious.should be_true
    end
  end

  context 'when pulling from the technology subreddit' do
    let(:lvp3) { ListingViewPreparer.new(ListingOwnership.find(2), {}) }

    it "has the title 'technology'" do
      lvp3.title.should == 'technology'
    end
  end

  context 'when pulling from the technology with a limit of 5 items' do
    let(:lvp4) { ListingViewPreparer.new(ListingOwnership.find(2), {:limit => 5}) }

    it 'has 5 or fewer items' do
      lvp4.listingItems.size.should be <= 5
    end
  end

end



