require "oauth"

request_token = nil

    
callback_url = "<could be anything, only used by websites>"
key= "<insert the consumer key here>"
secret= "<insert the secret here>"
consumer = OAuth::Consumer.new(key,secret, :site => "<insert site url here>")
 
if ARGV.size <= 0
  
  print "request new access token from site...\n"
 
  request_token = consumer.get_request_token(:oauth_callback => callback_url)
  print "token: #{request_token.token}\n"
  print "secret: #{request_token.secret}\n"
  
  print "authorize_url: #{request_token.authorize_url}\n"
  gets
else
  print "using token=#{ARGV[0]} secret=#{ARGV[1]}...\n"

  request_token = OAuth::RequestToken.new(consumer, ARGV[0], ARGV[1])
end


access_token = request_token.get_access_token

print "access_token.token: #{access_token.token}\n"
print "access_token.secret: #{access_token.secret}\n"

print "GET /hello_world\n"
response = access_token.get("/hello_world")
print "code: #{response.code}\n"
print "body: #{response.body}\n"

