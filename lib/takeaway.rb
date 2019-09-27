require_relative 'send_sms'

class Takeaway
  attr_accessor :dishes
  attr_reader :running_total
  attr_reader :order


  def initialize
    @order = []
    @running_total = 0
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

    if payment === @running_total
      @message
    end
  end
end

menu = Takeaway.new
menu.list
menu.select("Pizza", 4)
menu.select("Lasagne", 1)
puts menu.running_total
puts menu.order
puts menu.checkout(25)
