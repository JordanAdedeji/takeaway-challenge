require 'twilio-ruby'

account_sid = 'AC0495cf6a55c4d6f7af1fe122a4f13ab4'
auth_token = '31ef06db871adf98e4ebf5382153b430'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+441392690338' # Your Twilio number
to = '+447429188123' # Your mobile phone number
time = Time.new + 3600 # delivery time
@message = client.messages.create(
from: from,
to: to,
body: "Thank you! Your order was placed and will be delivered before #{time.strftime("%k:%M")}"
)
