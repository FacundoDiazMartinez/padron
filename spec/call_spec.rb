require 'spec_helper'

RSpec.describe "Call" do
	let!(:correct_document){ "25582042" }
	let!(:wrong_document){"000000000000000"}

  	it "must return array with two possible persons" do
  		result = Padron::Call.new(id: correct_document).get_data
  		expect(result).to be_an_instance_of(Array)
  	end

  	it "must return empty array if document is a wrong id" do
  		result = Padron::Call.new(id: wrong_document).get_data
  		expect(result.compact).to match_array([])
  	end

  	it "must return exception if document is blank" do
  		expect{Padron::Call.new(id: nil)}.to raise_error(Padron::NullOrInvalidAttribute)
  	end
end