
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

joe = People.new
joe.id = 'joe'
joes_acct = Account.new
joes_acct.owner = joe
joe.account = joes_acct

bank = Bank.new

atm_one = ATM.new
bank.add_atm(atm_one)
atm_one.add_user(joe)

atm_two = ATM.new
bank.add_atm(atm_two)
atm_two.add_user(fred)

money_joe = Money.new
money_joe.value = 250
money_fred = Money.new
money_fred.value = 1000

atm_two.deposit(money_joe.value, atm_two.find_user('joe'))
atm_one.deposit(money_fred.value, atm_one.find_user('fred'))

atm_one.withdrawal(50, atm_two.find_user('fred'))
atm_two.withdrawal(20, atm_one.find_user('joe'))
bank.transfer(100, atm_one.find_user('fred'), atm_two.find_user('joe'))

puts joe.account.money.value #$130
puts fred.account.money.value #$1050
