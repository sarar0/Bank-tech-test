require 'date' 

class Account

    def initialize(output = $stdout)
        @balance = 0
        @transactions = [["date || credit || debit || balance"]]
        @output = output
    end

    def deposit(date, amount)
        if validate(date, amount) == false
            fail 'Please enter a valid input for date and/or amount'
        else
            @balance += amount
            this_transaction = [[date, " || || ", sprintf("%.2f", amount), " || ", sprintf("%.2f", @balance)].join()]
            @transactions.insert(1, this_transaction)
            return this_transaction 
        end
    end

    def withdraw(date, amount)
        if validate(date, amount) == false
            fail 'Please enter a valid input for date and/or amount'
        else
            @balance -= amount
            this_transaction = [[date, " || ", sprintf("%.2f", amount), " || || ", sprintf("%.2f", @balance)].join()]
            @transactions.insert(1, this_transaction)
            return this_transaction 
        end
    end

    def print_statement
        @output.puts @transactions
        return @transactions.join("\n")
    end 

    def check_date(date)
        if Date.today >= DateTime.parse(date)
            return true
        else
            return false
        end
    end

    private

    def validate(date, amount)
        if check_date(date) == false || amount.is_a?(Numeric) == false
            return false
        else
            return true
        end
    end

end