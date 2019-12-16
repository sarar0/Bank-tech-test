require 'account'

describe Account do

    

    describe '#print_statement' do
        it 'prints the column headers when there are no transactions' do
            expect(subject.print_statement).to eq ('date || credit || debit || balance')
        end

        it 'prints column headers and transaction/balance when transaction is a 500 deposit on 14/01/2012' do
            subject.deposit
            expect(subject.print_statement).to eq ("date || credit || debit || balance\n14/01/2012 || || 500.00 || 2500.00")
        end

    end

    

end