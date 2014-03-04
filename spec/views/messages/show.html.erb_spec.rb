require 'spec_helper'

describe 'messages/show.html.erb' do
  it 'displays the text attribute of the message' do
    assign(:message, double('Message', :text => 'Hello World!'))
    render
    rendered.should contain('Hello World')
  end
end