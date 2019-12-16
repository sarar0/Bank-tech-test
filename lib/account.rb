class Account

    def initialize
        @transactions = [["date || credit || debit || balance"]]
    end

    def print_statement
        return @transactions.join()
    end 

end