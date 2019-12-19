require 'account'
require 'printer'

describe 'Printing statements' do

    describe 'user can print statements after transactions' do
        it 'prints column headers and transaction/balance when transaction is a 500 deposit on 14/01/2012' do
            account = Account.new
            account.deposit(500.00, '14-01-2012')
            expect { account.print_statement }.to output(
            <<~HEREDOC
                date || credit || debit || balance
                14/01/2012 || 500.00 || || 500.00
            HEREDOC
            ).to_stdout
        end
    
        it 'statement shows last input first' do
            account = Account.new
            account.deposit(500.00, '14-01-2012')
            account.withdraw(400.00, '15-01-2012')
            account.withdraw(50.00, '16-01-2012')
            expect { account.print_statement }.to output(
            <<~HEREDOC
                date || credit || debit || balance
                16/01/2012 || || 50.00 || 50.00
                15/01/2012 || || 400.00 || 100.00
                14/01/2012 || 500.00 || || 500.00
            HEREDOC
            ).to_stdout
        end
    end
end