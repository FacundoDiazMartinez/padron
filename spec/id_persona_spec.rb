require 'spec_helper'

RSpec.describe "IdPersona" do
	it "should return array of two posible CUILs" do
		response = Padron::IdPersona.new("36864268").return_cuits
		expect(response).to match_array(["20368642682", "27368642687"])
	end
end