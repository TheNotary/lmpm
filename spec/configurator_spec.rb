require 'spec_helper'

describe Lmpm::Configurator do
  
  before :each do
    @configurator = Lmpm::Configurator.new
    @path_to_lm_postinstall_script_direct = "https://raw.github.com/TheNotary/the_notarys_linux_mint_postinstall_configuration/master/lm_postinstall.cfg"
    @path_to_lm_postinstall_script_repo = "https://github.com/TheNotary/the_notarys_linux_mint_postinstall_configuration"
    # @url_to_version = "https://raw.github.com/aptana/studio3/master/features/com.aptana.feature/feature.xml"
    # @xml_code = {path: 'feature', name: 'version'}
    @url_to_aptana_dl_page = "http://www.aptana.com/downloads/start"
    @html_path = "form#aptana_download_form div.page-hd h1"
    @html_regex = /(\d\.\d\.\d)/
    
    @aptana_url = "http://download.aptana.com/studio3/standalone/3.4.0/linux/Aptana_Studio_3_Setup_Linux_x86_3.4.0.zip"
    @html_path_for_aptana_dl_url = "form#aptana_download_form div.col-main div.box-dark-main div.box-dark-main-left input#download_url"
    
    @sample_gems = ['hub', 'gas2']
    @sample_packages = ["hello"]
  end
  
  it "should do ruby gems" do
    response = @configurator.configure_ruby_gems(@sample_gems)
    response.split("\n").last.should eq "1 gem installed" # "#{@sample_gems.length} gems installed"
  end
  
  it "should install apt packages" do
    #binding.pry
    @configurator.install_apt_packages @sample_packages
  end

=begin

  it "should be able to pull down the config data when supplied path to raw cfg file", integration: true do
    VCR.use_cassette('script_direct', :record => :new_episodes) do
      configurator = Lmpm::Configurator.new(@path_to_lm_postinstall_script_direct)
      configurator.ruby_gems.first.should eq "gas2"
    end
    
  end
  
  it "should be able to pull down the config data when supplied path to repo", integration: true do
    VCR.use_cassette('script_repo', :record => :new_episodes) do
      configurator = Lmpm::Configurator.new(@path_to_lm_postinstall_script_repo)
      configurator.ruby_gems.first.should eq "gas2"
    end
    
  end
  
  it "should be able to scrape the aptana website for the latest version released", integration: true do
    VCR.use_cassette('scrape_version_aptana', :record => :new_episodes) do
      version = @congifurator.scrape_webpage(@url_to_aptana_dl_page, :html, @html_regex, @html_path)
    end
  end
  
  it "should be able to find the download url for linux", integration: true, current: true do
    url = @congifurator.scrape_webpage_for_download_link(@url_to_aptana_dl_page, nil, @html_path_for_aptana_dl_url)
    url.should eq @aptana_url
  end
  
=end
  
end

