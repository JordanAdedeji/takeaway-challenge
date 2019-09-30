require 'twilio-ruby'

class Takeaway
  attr_accessor :dishes
  attr_reader :running_total
  attr_reader :order


  def initialize
    @order = []
    @running_total = 0
    @account_sid = 'AC0495cf6a55c4d6f7af1fe122a4f13ab4'
    @auth_token = '31ef06db871adf98e4ebf5382153b430'
  end

  def list
    @dishes = [{"Pizza" => 6}, {"Lasagne" => 6}, {"Bolognese" => 6},
              {"Hot Wok Box Meal" => 8}, {"Katsu Curry" => 9}]
  end

  def select(dish, quantity)
    chosen = @dishes.find { |item| item[dish]}
    @running_total += chosen[dish] * quantity
    @order << {dish => quantity}
  end

  def total
    @running_total
  end

  def checkout(payment)
    fail "Your payment does not cover the balance" if payment != @running_total

    time = Time.new + 3600 # delivery time
    client = Twilio::REST::Client.new(@account_sid, @auth_token)
    message = client.messages.create(from: '+441392690338', to: '+447429188123',
              body: "Thank you! Your order was placed and will be delivered before #{time.strftime("%k:%M")}")
  end
end

# menu = Takeaway.new
# menu.list
# menu.select("Pizza", 4)
# menu.select("Lasagne", 1)
# puts menu.running_total
# puts menu.order
# puts menu.checkout(20)
