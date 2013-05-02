module Lmpm
  class Configurator
    
    def initialize(path = nil)
      @lm_configuration_data = get_configuration_data(path) unless path.nil? # note:  lm stands for linux mint
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
      
      
      YAML.load config_text
    end
    
    def ruby_gems
      @lm_configuration_data["ruby_gems"]
    end
    
    def apt_packages
      @lm_configuration_data["apt_packages"]
    end
    
    def scrape_webpage(url, parse_method = :xml, code)
      require 'open-uri';
      require 'rexml/document'
      
      file = open(url); 
      page_text = file.read;
      doc = REXML::Document.new(page_text);
      version = doc.elements['feature'].attributes['version'];
      
      if parse_method == :xml
        doc = REXML::Document.new(page_text)
        version = doc.elements['feature'].attributes['version']
      elsif parse_method == :regex
        page_text =~ code
        return $1
      end
      
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