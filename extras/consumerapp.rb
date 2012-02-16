require "oauth"

request_token = nil

    
callback_url = "http://127.0.0.1:3000/callback" # this could be anything (normally will be a url on the client website requesting access)
                                       # if this url is invalid you (as resource owner) will receive a 500 internal error after authorizing
                                       # the token


key= "sei0i2BuwipY8l2yKy6vsgE6zCiE04P43vU9u1rZ"
secret= "YQfZLTWK4ssCTTQIdPz13S6AdOjDzUit9m5puAPI"
consumer = OAuth::Consumer.new(key,secret, :site => "http://127.0.0.1:3000")

pin = nil
if ARGV.size <= 0
  
  print "request new access token from site using key=#{key} and secret=#{secret}...\n"
 
  request_token = consumer.get_request_token(:oauth_callback => callback_url)
  print "token: #{request_token.token}\n"
  print "secret: #{request_token.secret}\n"
  
  print "authorize_url: #{request_token.authorize_url}\n"
  print "Use the browser to access authorize_url, authorize the newly created token and then press enter the verifier\n" 
  pin = STDIN.readline.chomp
else
  print "using token=#{ARGV[0]} secret=#{ARGV[1]}...\n"

  request_token = OAuth::RequestToken.new(consumer, ARGV[0], ARGV[1])
end


access_token = request_token.get_access_token(:oauth_verifier => pin)

print "access_token.token: #{access_token.token}\n"
print "access_token.secret: #{access_token.secret}\n"

p access_token.get("/hello_world").body

