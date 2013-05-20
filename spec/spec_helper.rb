require 'lmpm'
require 'pry'


# Configure VCR, this thing alows you to record HTTP traffic so you never
# Need to connect to a server.  Tests run offline just fine!
require 'vcr'

VCR.configure do |c|
  c.allow_http_connections_when_no_cassette = true    # set to true if you're refreshing the cassets in fixtures
  c.cassette_library_dir = 'fixtures/vcr_cassettes'
  c.hook_into :webmock # or :fakeweb
end

