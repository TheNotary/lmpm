module Lmpm
  class Configurator
    
    def initialize(path = nil)
      @lm_configuration_text = get_configuration_data(path) # note:  lm stands for linux mint
    end
    
    def get_configuration_data(path)
      return "" if path.nil?
      if is_path_url?(path)
        path = get_proper_raw_url_for_github_config_file if is_path_a_github_url_that_isnt_a_raw_txt_file?(path)
        config_text = read_config_data_from_web(path)
      elsif is_path_valid_file?(path)
        config_text = read_config_data_from_file(path)
      else
        throw "get_configuration_data:  bad URL or file path.  Couldn't find configuration data."
      end
      
      config_text
    end
    
    def is_path_url?(path)
      
    end
    
    def is_path_valid_file?(path)
      
    end
    
    
    def is_path_a_github_url_that_isnt_a_raw_txt_file?(path)
      
    end
    
    def get_proper_raw_url_for_github_config_file(path)
      
    end
    
    def read_config_data_from_web(path)
      
    end
    
    def read_config_data_from_file(path)
      
    end
    
    
    
  end
end