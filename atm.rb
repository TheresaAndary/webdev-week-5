
# What does an ATM do?
# 	processes ID to see if your account is in this bank
# 	calculates based on input
# 	stores money
# 	gives you money
# 	checks your balance
# 	takes your money
# 	(charges you fees)

class Bank
end

class ATM

	def initialize
		@users = {}
	end

	def add_user(user)
		@users[user.id] = user
	end

	def find_user(user_id)
		return @users[user_id]
	end

	def delete_user(user_id)
		return @users.delete(user_id)
	end

	def deposit(value_amount, user)
		user.account.money.value += value_amount
	end

	def withdrawal(value_amount, user)
		user.account.money.value -= value_amount
	end
end

class People
	attr_accessor :id, :account
end

class Account
	attr_accessor :money, :owner
end



class Money
	attr_accessor :value

	def to_s
		return "$#{@value}"
	end
end

fred = People.new
fred.id = 'fred'
freds_acct = Account.new
freds_acct.owner = fred
fred.account = freds_acct

money = Money.new
money.value = 300
freds_acct.money = money

atm = ATM.new
atm.add_user fred
atm.deposit(200, fred)

puts fred.account.money.value
