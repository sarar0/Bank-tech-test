# frozen_string_literal: true

# rubocop:todo Layout/LineLength, Metrics/BlockLength

require 'account'

describe Account do

  describe '#deposit' do
    it 'saves the date and amount in the right order as string' do
      expect(subject.deposit(500.00, '14/01/2012')).to eq('14/01/2012 || 500.00 || || 500.00')
    end

    it 'raises an error if the input for the amount is not a number' do
      expect { subject.deposit('five', '14/01/2012') }.to raise_error('Please enter a valid input for date and/or amount')
    end

    it 'raises an error if the transaction date is not in the past' do
      expect { subject.deposit(300.00, '14/01/2022') }.to raise_error('Please enter a valid input for date and/or amount')
    end

    it 'raises an error if the amount is 0' do
      expect { subject.deposit(0, '14/01/2012') }.to raise_error('Please enter a valid input for date and/or amount')
    end
  end

  describe '#withdraw' do
    let(:account) { Account.new(1000) }

    it 'saves the date and amount in the right order as string, and balance is updated' do
      expect(account.withdraw(500.00, '14/01/2012')).to eq('14/01/2012 || || 500.00 || 500.00')
    end

    it 'raises an error if the input for the amount is not a number' do
      expect { account.withdraw('five', '14/01/2012') }.to raise_error('Please enter a valid input for date and/or amount')
    end

    it 'raises an error if the transaction date is not in the past' do
      expect { account.withdraw(300.00, '14/01/2022') }.to raise_error('Please enter a valid input for date and/or amount')
    end

    it 'raises an error if trying to withdraw an amount greater than the available balance' do
      expect { account.withdraw(1100.00, '15-01-2012') }.to raise_error('The amount exceeds the available balance by 100.00')
    end
  end

  describe '#wrong_date' do
    it 'returns true if date is in the past' do
      expect(subject.wrong_date?('11/07/2019')).to be false
    end

    it 'returns false if date is in the future' do
      expect(subject.wrong_date?('11/07/2029')).to be true
    end

  end

  describe '#print_statement' do
    it 'prints the column headers when there are no transactions' do
      expect { subject.print_statement }.to output(
        <<~HEREDOC
          date || credit || debit || balance
        HEREDOC
      ).to_stdout
    end

    it 'prints column headers and transaction/balance when transaction is a 500 deposit on 14/01/2012' do
      subject.deposit(500.00, '14/01/2012')
      expect { subject.print_statement }.to output(
        <<~HEREDOC
          date || credit || debit || balance
          14/01/2012 || 500.00 || || 500.00
        HEREDOC
      ).to_stdout
    end

    it 'prints with formatted date when date is entered as DD-MM-YYYY' do
      subject.deposit(500.00, '14-01-2012')
      expect { subject.print_statement }.to output(
        <<~HEREDOC
          date || credit || debit || balance
          14/01/2012 || 500.00 || || 500.00
        HEREDOC
      ).to_stdout
    end

    it 'prints with last input first' do
      subject.deposit(500.00, '14-01-2012')
      subject.withdraw(400.00, '15-01-2012')
      subject.withdraw(50.00, '16-01-2012')
      expect { subject.print_statement }.to output(
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

# rubocop:enable Layout/LineLength, Metrics/BlockLength
