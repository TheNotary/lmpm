require 'spec_helper'

describe "The app" do
	it "should display version number" do
		Lmpm.version.should eq Lmpm::VERSION
	end

	describe "Configure" do
    before :each do
			@uri = "https://github.com/TheNotary/the_notarys_linux_mint_postinstall_configuration"
		end

		it "should be able to configure LM based on a config file (link)" do
			Lmpm.configure(@uri).should eq Lmpm.data[:successful_configure_message]
		end
	end

end
