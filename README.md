## Bank tech test

#### Project setup steps: 
 1. Initialised git, created a Gemfile through 'bundle init'.
 2. Installed SimpleCov.
 3. Installed Rubocop.

#### Design approach: 

 1.  I first developed the following user stories:

            As a bank customer, 
            So that I can keep my money at the bank, 
            I want to to be able to deposit funds.

            As a bank customer, 
            So that I can access my money, 
            I want to be able to withdraw funds.

            As a bank customer, 
            So that I can see all my transactions and balance, 
            I want to print a bank statement. 
                
 2. As initial step, I identified the actions/verbs and nouns from the user stories and the acceptance criteria. ACTIONS: deposit, withdraw, and print statements. NOUNS: date, amount, balance. I drew a class diagram:

            --------------------------
            |        Account         |
            --------------------------
            |  Attributes:           |
            |  @balance              |   
            |  @transactions         |           
            --------------------------
            |  Methods:              |
            |  deposit(date, amount) |
            |  withdraw(date, amount)|
            |  print_statement       |
            --------------------------

 3. I developed some acceptance crtieria based on the ones provided in the specifications: 

    - For each deposit, date and amount should be recorded.
    - For each withdrawal, date and amount should be recorded.
    - The bank statement should have the following headers (in this order): date, credit, debit, balance. Each column should be separated by "||" and each transaction should show on a separate line.
    - If the transaction was a withdrawal, the "deposit" column should be empty and viceversa.
    - The statement should show the transaction in reverse order, i.e. the last one first. I have made an assumption that the input will be provided in chronological order.
    - Date formatting on the statement should be DD/MM/YYYY, but the input might be DD-MM-YYYY.
    - Amounts should be floats with two decimal places.
    - The initial balance would be zero by defaul, by the class could be instantiated with a different initial balance (ideally I would have like to clarify this requirement).

    Edge cases/required validations:
    - The amount for a deposit/withdrawal can only be greater than zero.
    - The maximum amount that can be withdrawn is equivalent to the available balance (I have assumed this, but ideally this should be clarified).
    - Transaction date cannot be a future date. 

#### Structure:

I decided to only have one class (Account), as all the attributes and methods (i.e. bank transactions) seem to logically fit under and interact with the concept of a 'bank account'. Upon instantiation, the class would have a @balance property (set to 0) and an empty array for @transactions. 

#### How to install and run code and tests:

The program can be run in IRB by requiring the ```account.rb``` file. Tests can be run thorugh the ```rspec``` command in the terminal (from root folder).

#### Example from IRB:

    2.6.5 :002 > account = Account.new
    => #<Account:0x00007f8da9176608 @balance=0, @transactions=[["date || credit || debit || balance"]]> 
    2.6.5 :003 > account.deposit("14/10/2019", 1000)
    => ["14/10/2019 || 1000.00 || || 1000.00"] 
    2.6.5 :004 > account.withdraw("13-11-2019", 200)
    => ["13/11/2019 || || 200.00 || 800.00"] 
    2.6.5 :005 > account.withdraw("13-11-2019", 100)
    => ["13/11/2019 || || 100.00 || 700.00"] 
    2.6.5 :006 > account.deposit("14/11/2019", 50)
    => ["14/11/2019 || 50.00 || || 750.00"] 
    2.6.5 :007 > account.print_statement
    date || credit || debit || balance
    14/11/2019 || 50.00 || || 750.00
    13/11/2019 || || 100.00 || 700.00
    13/11/2019 || || 200.00 || 800.00
    14/10/2019 || 1000.00 || || 1000.00

#### Possible extensions:

If I had more time, I would have liked to add a 'filter' to the 'print_statement' method, i.e. add two arguments so that the method would take a date range - this way the customer could print all the transactions in the specific date range.

I would have liked to work on a 'Bank' class, within which a customer could hold multiple accounts and print statements for each account.

I would have also like to refactor the error messages to make them more specific. 

