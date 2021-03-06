# frozen_string_literal: true

# rubocop:todo Layout/LineLength, Metrics/BlockLength

require 'account'

describe Account do

  describe '#deposit' do
    let(:account) { Account.new(balance: 100) }

    it 'returns a balance of 150 when initial balance is 100 and deposit is 50' do
      expect(account.deposit(50.00, '14-01-2012')[-1][-1]).to eq(150.00)
    end

    it 'raises an error if the input for the amount is not a number' do
      expect { subject.deposit('five', '14-01-2012') }.to raise_error('Please enter a valid input for date and/or amount')
    end

    it 'raises an error if the transaction date is not in the past' do
      expect { subject.deposit(300.00, '14-01-2022') }.to raise_error('Please enter a valid input for date and/or amount')
    end

    it 'raises an error if the amount is 0' do
      expect { subject.deposit(0, '14-01-2012') }.to raise_error('Please enter a valid input for date and/or amount')
    end
  end

  describe '#withdraw' do
    let(:account) { Account.new(balance: 1000) }

    it 'returns a balance of 150 when initial balance is 100 and withdrawal is 50' do
      expect(account.withdraw(500.00, '14-01-2012')[-1][-1]).to eq(500.00)
    end

    it 'raises an error if the input for the amount is not a number' do
      expect { account.withdraw('five', '14-01-2012') }.to raise_error('Please enter a valid input for date and/or amount')
    end

    it 'raises an error if the transaction date is not in the past' do
      expect { account.withdraw(300.00, '14-01-2022') }.to raise_error('Please enter a valid input for date and/or amount')
    end

    it 'raises an error if trying to withdraw an amount greater than the available balance' do
      expect { account.withdraw(1100.00, '15-01-2012') }.to raise_error('The amount exceeds the available balance by 100.00')
    end
  end

  describe '#wrong_date' do
    it 'returns true if date is in the past' do
      expect(subject.wrong_date?('11-07-2019')).to be false
    end

    it 'returns false if date is in the future' do
      expect(subject.wrong_date?('11-07-2029')).to be true
    end

  end  

  describe '#print_statement' do
    it 'can print' do
      printer_class_double = double :printer_class
      account = Account.new(printer_class: printer_class_double)
      expect(printer_class_double).to receive(:print_formatted_list) 
      account.print_statement
    end

  end  

end

# rubocop:enable Layout/LineLength, Metrics/BlockLength
