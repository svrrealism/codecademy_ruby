class Account
  attr_reader :name, :balance
  def initialize(name, balance=100)
    @name = name
    @balance = balance
  end

  def display_balance(pin_number)
    if pin == pin_number
      puts "Balance: #{@balance}"
    else
      return pin_error
    end
  end

  #Add two private methods, pin and pin error

  private
  def pin()
    @pin = 1234
  end

  def pin_error
    return "Access denied: incorrect PIN."
  end

  public
  def withdraw(pin_number, amount)
    if @pin == pin_number
      @balance += amount
      puts "Withdrew #{amount}. New balance: $#{@balance}."
    else
      puts pin_error
    end
  end

  def deposit(pin_number, amount)
    if @pin == pin_number
      @balance -= amount
      puts "Deposited #{amount}. New balance: $#{@balance}"
    else
      puts pin_error
    end
  end
end


checking_account = Account.new("zenulv")

checking_account.deposit('1234', '50000000')
