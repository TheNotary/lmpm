require 'spec_helper'

describe Lmpm::Configurator do
  
  before :each do
    @congifurator = Lmpm::Configurator.new
    @path_to_lm_postinstall_script_direct = "https://raw.github.com/TheNotary/the_notarys_linux_mint_postinstall_configuration/master/lm_postinstall.cfg"
    @path_to_lm_postinstall_script_repo = "https://github.com/TheNotary/the_notarys_linux_mint_postinstall_configuration"
    @url_to_version = "https://raw.github.com/aptana/studio3/master/features/com.aptana.feature/feature.xml"
    @xml_code = {path: 'feature', name: 'version'}
  end
  
  it "should be able to pull down the config data when supplied path to raw cfg file", :integration => true, current: true do
    VCR.use_cassette('script_direct', :record => :new_episodes) do
      configurator = Lmpm::Configurator.new(@path_to_lm_postinstall_script_direct)
      configurator.ruby_gems.first.should eq "gas2"
    end
    
  end
  
  it "should be able to pull down the config data when supplied path to repo", integration: true, current: true do
    VCR.use_cassette('script_repo', :record => :new_episodes) do
      configurator = Lmpm::Configurator.new(@path_to_lm_postinstall_script_repo)
      configurator.ruby_gems.first.should eq "gas2"
    end
    
  end
  
  it "should be able to scrape the aptana website for the latest version released" do
    # @congifurator.scrape_webpage(@url_to_version, :xml, @xml_code)
  end
  
end

