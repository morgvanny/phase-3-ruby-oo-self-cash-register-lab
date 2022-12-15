class CashRegister
  attr_reader :discount, :items, :last_amount
  attr_accessor :total

  def initialize(discount = 0)
    @discount = discount
    @total = 0
    @items = []
  end

  def add_item(title, price, quantity = 1)
    @last_amount = price * quantity
    self.total += @last_amount
    quantity.times do
      self.items << title
    end
  end

  def apply_discount
    if discount == 0
      "There is no discount to apply."
    else
      self.total -= self.total * discount / 100
      "After the discount, the total comes to $#{total}."
    end
  end

  def void_last_transaction
    self.total -= last_amount
  end
end
