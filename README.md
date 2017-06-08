* Practise tech test week 9 at Makers Academy.

* Challenge was to write code which can be interacted with in a REPL, enabling a user to create a bank account, make deposits and withdrawals, and see a printed statement.

* Also has an overdraft limit which is set on initialization but can be changed with 'extend_overdraft`    

* To play with it yourself clone the repository, navigate into the folder, and then:  
`pry` or `irb`  
`require './lib/account.rb'`  
`account = Account.new(-200)`  
`account.deposit(100)`  
`account.withdraw(10)`  
`account.withdraw(5)`  
`account.statement`  
and you should see something like...
```
date || credit || debit || balance
08/06/2017 || || 5.00 || 85.00
08/06/2017 || || 10.00 || 90.00
08/06/2017 || 100.00 || || 100.00
```
