require 'rest-client'

begin
  response = RestClient.get('https://tls.testegerencianet.com.br', headers={})
  puts response
rescue Exception => e
  puts 'Got error!'
  puts e
  raise e
end