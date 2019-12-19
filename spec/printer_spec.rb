require 'printer'

describe Printer do

    describe '#format_numbers(list)' do
        it 'transforms integers to floats with two decimal points, when given a nested array of strings and numbers' do
            list = [[2]]
            expect(described_class.format_numbers(list)).to eq([["2.00"]])
        end

    end   
    
    describe '#print' do  
        it 'prints the column headers when there are no transactions' do
            list = []
            expect { described_class.print_formatted_list(list) }.to output(
              <<~HEREDOC
                date || credit || debit || balance
              HEREDOC
            ).to_stdout
          end

        it 'prints a string after the column headers' do
            list = [["sample text"]]
            expect { described_class.print_formatted_list(list) }.to output(
                <<~HEREDOC
                  date || credit || debit || balance
                  sample text
                HEREDOC
              ).to_stdout
        end
    
    end

end