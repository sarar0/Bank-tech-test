### Bank tech test

#### Initial steps: 
 1. Initialised git, created a Gemfile through 'bundle init'.
 2. Installed SimpleCov and Rubocop.

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
        |  deposit(amount, date) |
        |  withdraw(amount, date)|
        |  print_statement       |
        --------------------------

 3. I developed some acceptance crtieria based on the ones provided in the specifications: 

    - For each deposit, date and amount should be recorded.
    - For each withdrawal, date and amount should be recorded.
    - The bank statement should have the following headers (in this order): date, credit, debit, balance. Each column should be separated by "||" and each transaction should show on a separate line.
    - If the transaction was a withdrawal, the "deposit" column should be empty and viceversa.
    - Date formatting should be DD/MM/YYYY.
    - Amounts should show two decimals.
    - The initial balance is zero (ideally I would have like to clarify this requirement).

    Edge cases/required validations:
    - The amount for a deposit/withdrawal can only be greater than zero.
    - The maximum amount that can be withdrawn is equivalent to the available balance (I have assumed this but ideally this should be clarified).
    - Transaction date cannot be a future date. 

#### Structure:
I decided to only have one class (Account), as all the attributes and method seem to logically fit under and interact with the concept of a 'bank account'. Upon instantiation, the class would have a @balance property (set to 0) and an empty array for @transactions. 

#### How to install and run code and tests:

The program can be run in IRB by requiring the ```account.rb``` file. Test can be run thorugh the ```rspec``` command in the terminal (from root folder).

#### Dependencies:

TO BE INSERTED

#### Screenshots/Sample:

TO BE INSERTED

#### Possible extensions:

TO BE INSERTED
