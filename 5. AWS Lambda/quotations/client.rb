require 'jsom'
require 'faraday'

URL = ''

connection  = Faraday.new(url: URL)
response = connection.get do |request|
  request.params['id'] = 7
end

if response.success?
  puts response.status
  data = JSON.parse(respone.body)
  puts data['id']
  puts data['author']
  puts data['excerpt']
  
end