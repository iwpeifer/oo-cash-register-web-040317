require 'pry'

class CashRegister

	attr_accessor :total, :discount, :last_item_prices
	attr_reader :items

	def initialize(discount=0)
		@total = 0
		@discount = discount
		@items = []
		@last_item_prices = []
	end

	def total
		@total
	end

	def add_item(item, price, quantity=1)
		quantity.times { @items << item }
		quantity.times { @last_item_prices << price * quantity }
		self.total += price * quantity
	end

	def apply_discount
		if @discount == 0
			"There is no discount to apply."
		else
			self.total -= (self.total.to_f * @discount / 100).to_i
			"After the discount, the total comes to $#{self.total}."
		end
	end

	def items
		@items
	end

	def void_last_transaction
		@items.pop
		self.total -= @last_item_prices.pop
	end

end


