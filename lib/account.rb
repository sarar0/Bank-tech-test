class Account

    def initialize
        @balance = 0
        @transactions = []
    end

    def deposit
        @transactions.push(["14/01/2012 || || 500.00 || 2500.00"])
    end

    def withdraw(date, amount)
    
    end


    def print_statement
        statement = [["date || credit || debit || balance"]]
        @transactions.each do |line| 
            statement.push(line.join())
        end
        return statement.join("\n")
    end 

end