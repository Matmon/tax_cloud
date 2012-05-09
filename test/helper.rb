require 'test/unit'
require 'tax_cloud'
require 'json'

class Test::Unit::TestCase
  def setup
    config_file = File.join(File.dirname(__FILE__), 'taxcloud_config.yml')
    TaxCloud.configure do |config|
      YAML.load_file(config_file).each do |method, value|
        config.send("#{method}=", value)
      end
    end
  end
end

Savon.configure do |config|
  config.log = false
end

require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'test/cassettes'
  c.stub_with :webmock
  c.filter_sensitive_data('api-login-id')  { TaxCloud.configuration.api_login_id }
  c.filter_sensitive_data('api-key')       { TaxCloud.configuration.api_key }
  c.filter_sensitive_data('usps-username') { TaxCloud.configuration.usps_username }  
end
