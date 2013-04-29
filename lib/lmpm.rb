require "lmpm/version"
require "lmpm/data"

module Lmpm
  # Your code goes here...
	def self.show
		show_data = ""

		return show_data
	end

	def self.configure(config_path)
		Lmpm.data[:successful_configure_message]
	end

	def self.version
		VERSION
	end

end
