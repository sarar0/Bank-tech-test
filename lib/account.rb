require 'date' 

class Account
    def initialize
        @balance = 0
        @transactions = [["date || credit || debit || balance"]]
    end

    def deposit(date, amount)
        if validate(date, amount) == false
            fail 'Please enter a valid input for date and/or amount'
        else
            @balance += amount
            this_transaction = format_string_deposit(date, amount)
            @transactions.insert(1, this_transaction)
            return this_transaction 
        end
    end

    def withdraw(date, amount)
        if validate(date, amount) == false
            fail "Please enter a valid input for date and/or amount"
        else
            if amount - @balance > 0
                fail "The amount exceeds the available balance by #{sprintf("%.2f",(amount - @balance))}"
            else
                @balance -= amount
                this_transaction = format_string_withdrawal(date, amount)
                @transactions.insert(1, this_transaction)
                return this_transaction 
            end
        end
    end

    def print_statement
        puts @transactions
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

    def format_string_deposit(date, amount)
        return  [[date.gsub(/-/, '/'), " || ", sprintf("%.2f", amount), " || || ", sprintf("%.2f", @balance)].join()]
    end

    def format_string_withdrawal(date, amount)
        return [[date.gsub(/-/, '/'), " || || ", sprintf("%.2f", amount), " || ", sprintf("%.2f", @balance)].join()]
    end

    def validate(date, amount)
        if check_date(date) == false || amount.is_a?(Numeric) == false  || amount <=0
            return false
        else
            return true
        end
    end

end