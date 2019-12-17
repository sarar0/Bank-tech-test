# frozen_string_literal: true

# This class contains all methods needed to interact with an account

require 'date'

class Account
  def initialize(balance = 0)
    @balance = balance
    @transactions = ['date || credit || debit || balance']
  end

  def deposit(date, amount)
    validate(date, amount) 
    @balance += amount
    deposit = format_string(date, amount, @balance).insert(3, "||")
    add_to_list(@transactions, deposit)
    deposit.join(" ")
  end

  def withdraw(date, amount)
    validate(date, amount)
    if (amount - @balance).positive?
      raise "The amount exceeds the available balance by #{format('%.2f', (amount - @balance))}"
    end
    @balance -= amount
    withdrawal = format_string(date, amount, @balance).insert(1, "||")
    add_to_list(@transactions, withdrawal)
    withdrawal.join(" ")
  end

  def print_statement
    puts @transactions
  end

  def check_date(date)
    Date.today >= DateTime.parse(date)
  end

  private

  def add_to_list(list, transaction)
    list.insert(1, transaction.join(" "))
  end 
  
  def format_string(date, amount, balance)
    [date.gsub(/-/, '/'), "||", format('%.2f', amount), "||", format('%.2f', balance)]
  end

  def validate(date, amount)
    if check_date(date) == false || amount.is_a?(Numeric) == false || amount <= 0
      raise 'Please enter a valid input for date and/or amount'
    end
  end
end
