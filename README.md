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
            --------------------------

            --------------------------
            |        Printer         |
            --------------------------
            |  Methods:              |
            |  formatting            |
            |  print_statement       |
            --------------------------    


 3. I developed some acceptance crtieria based on the ones provided in the specifications: 

    - For each deposit, date and amount should be recorded.
    - For each withdrawal, date and amount should be recorded.
    - The bank statement should have the following headers (in this order): date, credit, debit, balance. Each column should be separated by "||" and each transaction should show on a separate line.
    - If the transaction was a withdrawal, the "deposit" column should be empty and viceversa.
    - The statement should show the transaction in reverse order, i.e. the last one first. The date is passed in as an argument, and its default value is Time.now,
    - Date formatting on the statement should be DD/MM/YYYY, but the input might be DD-MM-YYYY.
    - Amounts should be floats with two decimal places.
    - The initial balance would be zero by default, but the class could be instantiated with a different initial balance (ideally I would have like to clarify this requirement).

    Edge cases/required validations:
    - The amount for a deposit/withdrawal can only be greater than zero.
    - The maximum amount that can be withdrawn is equivalent to the available balance (I have assumed this, but ideally this should be clarified).
    - Transaction date cannot be a future date. 

#### Structure:

I would have two classes: 
- Account, which would be responsible for managing all transactions.
- Printer, which would format the statement and print it.

#### How to install and run code and tests:

The program can be run in IRB by requiring the ```account.rb``` file. Tests can be run thorugh the ```rspec``` command in the terminal (from root folder).

#### Example from IRB:





#### Possible extensions:

If I had more time, I would have liked to add a 'filter' to the 'print_statement' method, i.e. add two arguments so that the method would take a date range - this way the customer could print all the transactions in the specific date range.

I would have liked to work on a 'Bank' class, within which a customer could hold multiple accounts and print statements for each account.

I would have also like to refactor the error messages to make them more specific. 

