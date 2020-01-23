require 'spec_helper'

RSpec.describe "AuthData" do
  it "should create constants for todays data" do
    Padron::AuthData.fetch
    expect(Padron.constants).to include(:TOKEN, :SIGN)
  end
end