require 'account'

describe Account do

    describe "#print_statement" do
        it 'prints the colums headers when there are no transactions' do
            expect(subject.print_statement).to eq ('date || credit || debit || balance')
        end
    end

    

end