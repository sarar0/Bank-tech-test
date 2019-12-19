# frozen_string_literal: true

require 'date'
require_relative 'printer'

class Account

  def initialize(printer_class: Printer, balance: 0)
    @balance = balance
    @transactions = []
    @printer_class = printer_class
  end

  def deposit(amount, date = Time.now.strftime("%d/%m/%Y"))
    validate(date, amount) 
    @balance += amount
    @transactions.unshift([date, "||", amount, "|| ||", @balance])
  end

  def withdraw(amount, date = Time.now.strftime("%d/%m/%Y"))
    validate(date, amount)
    raise "The amount exceeds the available balance by #{format('%.2f', (amount - @balance))}" if (amount - @balance).positive?
    @balance -= amount
    @transactions.unshift([date, "|| ||", amount, "||", @balance])
  end

  def wrong_date?(date)
    Date.today < DateTime.parse(date)
  end

  def print_statement
    @printer_class.print_formatted_list(@transactions)
  end

  private

  def validate(date, amount)
    if wrong_date?(date) || amount.is_a?(Numeric) == false || amount <= 0
      raise 'Please enter a valid input for date and/or amount'
    end
  end
end
