require_relative 'spec_helper'
require_relative 'rails_helper'

describe TwitterConnection do
  context '#create_client' do 
    it 'creates a new Twitter API connection' do
      twitter = TwitterConnection.new
      expect(twitter.create_client).to be_kind_of(Twitter::REST::Client)
    end
  end

end