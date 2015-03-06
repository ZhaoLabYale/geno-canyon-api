require 'uri'
require 'rest-client'
require 'json'

n = 1_000_000
uri = 'http://localhost:3000/genome'
hash = {}
hash["chrom"] = 1
hash["locs"] = (1..n).to_a
resource = RestClient::Resource.new(uri, timeout: nil)
res = resource.post(hash, content_type: :json, accept: :json)

puts JSON.parse(res.body)

