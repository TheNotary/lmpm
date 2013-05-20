module Lmpm
  class Configurator
    
    def initialize(path = nil)
      @lm_configuration_data = get_configuration_data(path) unless path.nil? # note:  lm stands for linux mint
      begin_configuring(@lm_configuration_data)
    end
    
    def get_configuration_data(path)
      return "" if path.nil? # can be removedish...
      if is_path_url?(path)
        
        config_text = read_config_data_from_web(path)
        if !valid_yaml_string?(config_text)
          path = get_proper_raw_url_for_github_config_file(path)
          config_text = read_config_data_from_web(path)
        end
        
      elsif is_path_valid_file?(path)
        config_text = read_config_data_from_file(path)
      else
        throw "get_configuration_data:  bad URL or file path.  Couldn't find configuration data."
      end
      
      
      YAML.safe_load config_text
    end
    
    def begin_configuring(lm_configuration_data)
      #binding.pry
      # Install ruby gems
      #configure_ruby_gems lm_configuration_data["ruby_gems"]
      # Install apt packages
      #install_apt_packages apt_packages
      # Manually Install Binaries (unzip or .configure; make; make install)
      # TODO:  Do this fancy part later... It's for installing Aptana
      # Perform File hacks to LM OS files
      #patch_linux_mint_files
      # Conduct dconf edits
      # Place any misc configuration files??
    end
    
    def ruby_gems
      @lm_configuration_data["ruby_gems"]
    end
    
    def apt_packages
      @lm_configuration_data["apt_packages"]
    end
    
    def configure_ruby_gems(ruby_gems)
      # make it so ruby_gems is a clean list I can do gem install on
      # FIXME:  There's a security hole here that must be fixed... escape semicolons and weird stuff...
      `gem install #{ruby_gems.join(" ")}`
    end
    
    def install_apt_packages(packages)
      `sudo apt-get install #{packages.join(" ")}`
    end
    
    def patch_linux_mint_files
      
    end
    
    def scrape_webpage(url, parse_method, regex, path = nil)
      require 'open-uri';
      require 'rexml/document' # for xml parsing
      require 'hpricot'        # for html parsing
      
      file = open(url); 
      page_text = file.read;
      
      if parse_method == :xml
        throw "#scrape_webpage:  i'm a stub and will fail"
        doc = REXML::Document.new(page_text)
        version = doc.elements['feature'].attributes['version']
      elsif parse_method == :html
        doc = Hpricot(page_text)
        version = (doc / path).text
        binding.pry
        
        unless regex.nil?
          version =~ regex
          version = $1
        end
        return version
      elsif parse_method == :regex
        page_text =~ regex
        return $1
      end
      
    end
    
    def scrape_webpage_for_download_link(url, regex, path = nil)
      require 'open-uri';
      require 'hpricot'        # for html parsing
      require 'execjs'  # for executing js...
      require 'nokogiri'
      
      file = open(url); 
      page_text = file.read;
      
      doc = Nokogiri::HTML(page_text)
      # path = ""
      version = (doc / path).text
      
      javascript_for_urls = (doc / "div#content script").first
      
      binding.pry
      
      unless regex.nil?
        version =~ regex
        version = $1
      end
      return version
    end
    
    def is_path_url?(path)
      return true if path =~ URI::regexp
    end
    
    def is_path_valid_file?(path)
      #throw "stub"
    end
    
    def get_proper_raw_url_for_github_config_file(path)
      path.sub("https://github.com", "https://raw.github.com") + "/master/lm_postinstall.cfg"
    end
    
    def read_config_data_from_web(path)
      file = open(path)
      file.read
    end
    
    def read_config_data_from_file(path)
      #throw "stub"
    end
    
    def valid_yaml_string?(config_text)
      begin
        YAML.safe_load(config_text)
        return true
      rescue Exception => e
        return false
      end
    end
    
  end
end