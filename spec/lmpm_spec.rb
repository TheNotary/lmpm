require 'spec_helper'

describe "The app" do
	it "should work" do
		Lmpm.version.should eq Lmpm::VERSION
	end

end
