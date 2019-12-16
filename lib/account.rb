class Account

    def initialize(output = $stdout)
        @balance = 0
        @transactions = [["date || credit || debit || balance"]]
        @output = output
    end

    def deposit(date, amount)
        @balance += amount
        this_transaction = [[date, " || || ", sprintf("%.2f", amount), " || ", sprintf("%.2f", @balance)].join()]
        @transactions.insert(1, this_transaction)
        return this_transaction 
    end

    def withdraw(date, amount)
        @balance -= amount
        this_transaction = [[date, " || ", sprintf("%.2f", amount), " || || ", sprintf("%.2f", @balance)].join()]
        @transactions.insert(1, this_transaction)
        return this_transaction 
    end

    def print_statement
        @output.puts @transactions
        return @transactions.join("\n")
    end 

end