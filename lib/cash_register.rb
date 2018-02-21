require 'pry'


class CashRegister

	attr_reader :discount, :all_items, :last_transaction

	def initialize(discount=0)
		@total = 0
		@discount = discount
		@all_items = []
		@last_transaction = nil
	end

	def add_item(title, price, quantity=1)
		self.total += price * quantity
		quantity.times  {self.all_items << title}
		@last_transaction = price
	end

	def apply_discount
		if self.discount == 0
			return "There is no discount to apply."
		end
		self.total *= (1.0 - (self.discount / 100.0))
		self.total = self.total.to_i
		"After the discount, the total comes to $#{self.total}." 

	end

	def total=(total)
		@total = total
	end

	def total
		@total
	end

	def items
		self.all_items
	end

	def void_last_transaction
		self.total -= self.last_transaction
	end

end

# binding.pry

# print 'done'