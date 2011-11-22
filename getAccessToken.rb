require './lib/dropbox_sdk'

APP_KEY = 'Put your AppKey'
APP_SECRET = 'Put your AppSecretKey'
ACCESS_TYPE = 'put :app_folder or :dropbox' 

session = DropboxSession.new(APP_KEY, APP_SECRET)

session.get_request_token

session.set_access_token(ACCESS_TOKEN, ACCESS_SECRET)

authorize_url = session.get_authorize_url

puts "AUTHORIZING", authorize_url
puts "Please visit that web page and hit 'Allow', then hit Enter here."
gets

res = session.get_access_token
puts res.inspect
