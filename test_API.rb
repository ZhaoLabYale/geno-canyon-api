require 'uri'
require 'rest-client'
require 'json'

n = ARGV.first ? ARGV.first.to_i : 1_000_01
uri = 'http://localhost:3000/genome'
hash = {}
hash["chrom"] = 1
hash["locs"] = (1..n).to_a
resource = RestClient::Resource.new(uri, timeout: nil)
res = resource.post(hash, content_type: :json, accept: :json)

File.open("tmp/temp_result", "w") do |f|
  f.puts JSON.parse(res.body)
end

if `wc -l tmp/temp_result`.match /^#{n}/
  puts "Success"
  `rm tmp/temp_result`
else
  puts "Error"
  puts res.code
  puts res.body
end

