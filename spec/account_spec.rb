require 'account'

describe Account do

    describe '#deposit' do
        it 'saves the date and amount in the right order as string' do
            expect(subject.deposit("14/01/2012", 500.00)).to eq(["14/01/2012 || 500.00 || || 500.00"])
        end

        it 'raises an error if the input for the amount is not a number' do
            expect { subject.deposit("14/01/2012", "five") }.to raise_error('Please enter a valid input for date and/or amount')
        end

        it 'raises an error if the transaction date is not in the past' do
            expect { subject.deposit("14/01/2022", 300.00) }.to raise_error('Please enter a valid input for date and/or amount')
        end

    end

    describe '#withdraw' do
        it 'saves the date and amount in the right order as string, and balance is updated' do
            subject.deposit("14/01/2012", 1000.00)
            expect(subject.withdraw("14/01/2012", 500.00)).to eq(["14/01/2012 || || 500.00 || 500.00"])
        end

        it 'raises an error if the input for the amount is not a number' do
            expect { subject.withdraw("14/01/2012", "five") }.to raise_error('Please enter a valid input for date and/or amount')
        end

        it 'raises an error if the transaction date is not in the past' do
            expect { subject.withdraw("14/01/2022", 300.00) }.to raise_error('Please enter a valid input for date and/or amount')
        end

        it 'raises an error if trying to withdraw an amount greater than the available balance' do
            subject.deposit("14-01-2012", 100.00)
            expect { subject.withdraw("15-01-2012", 200.00) }.to raise_error('The amount exceeds the available balance by 100.00')
        end

    end

    describe '#date_check' do
        it 'returns true if date is in the past' do
            expect(subject.check_date("11/07/2019")).to be true
        end

        it 'returns false if date is in the future' do
            expect(subject.check_date("11/07/2029")).to be false
        end
    end

    describe '#print_statement' do
        it 'prints the column headers when there are no transactions' do
            expect(subject.print_statement).to eq("date || credit || debit || balance")
        end

        it 'prints with last input first and with formatted dates when dates are entered as DD-MM-YYYY' do
            subject.deposit("14-01-2012", 500.00)
            subject.withdraw("15-01-2012", 400.00)
            expect(subject.print_statement).to eq("date || credit || debit || balance\n15/01/2012 || || 400.00 || 100.00\n14/01/2012 || 500.00 || || 500.00")
        end

        it 'prints column headers and transaction/balance when transaction is a 500 deposit on 14/01/2012' do
            subject.deposit("14-01-2012", 500.00)
            expect(subject.print_statement).to eq("date || credit || debit || balance\n14/01/2012 || 500.00 || || 500.00")
        end
    end

end