require './lib/dropbox_sdk'

APP_KEY = 'put your App Key'
APP_SECRET = 'put your App Secret'
ACCESS_TYPE = 'put :app_folder or :dropbox'
ACCESS_TOKEN = 'put your Access Token'
ACCESS_SECRET = 'put your Access Token Secret'

session = DropboxSession.new(APP_KEY, APP_SECRET)

session.get_request_token

session.set_access_token(ACCESS_TOKEN, ACCESS_SECRET)

#authorize_url = session.get_authorize_url

#puts "AUTHORIZING", authorize_url
#puts "Please visit that web page and hit 'Allow', then hit Enter here."
#gets

#session.get_access_token

client = DropboxClient.new(session, ACCESS_TYPE)

pretime = 0
diff = 0
upfiles = ["1", "5", "10", "20", "50"]

for upfile in upfiles
    puts "* case: " + upfile + "MB"
    size = upfile.to_i * 1024

    file = open(upfile)
    pretime = Time.now.to_i
    response = client.put_file('/' + upfile, file)
    diff = (Time.now.to_i - pretime)
    puts "    up time: " + diff.to_s  + "[s] (" + (size / diff).to_s +  "[KB/s])"

    pretime = Time.now.to_i
    out = client.get_file('/' + upfile)
    diff = (Time.now.to_i - pretime)
    puts "    dl time: " + diff.to_s + "[s] (" + ( size / diff).to_s +  "[KB/s])"
    puts
end
