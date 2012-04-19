require 'yaml'

# Setup the APP_CONFIG with its variables
raw_config = YAML.load(File.read("./config/app_config.yml"))[ENV['RACK_ENV']]
APP_CONFIG = raw_config.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}