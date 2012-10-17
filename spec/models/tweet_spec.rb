require 'spec_helper'

describe Tweet do 

	pending "add some examples"
	
	describe 'attributes' do
		it 'has tweet attribute' do
			t = Tweet.new
			t.tweet = "testtweet"
			expect(t.tweet).to eq("testtweet")
		end

	end #end tweet describe
end