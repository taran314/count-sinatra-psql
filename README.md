# Description
This is a counter web app built in Ruby using Sinatra and Capybara. This app uses PostgreSQL to store the count.

# Setting up the database
1. Connect to `psql`
2. Create the production and test databases using the psql commands `CREATE DATABASE count_manager;` and `CREATE DATABASE count_manager_test;`
3. Connect to the production database using the pqsl command `\c count_manager;`
4. Run the queries saved in the file `01_create_counter_table.sql`
5. Repeat steps 3 and 4 for the test database.

# How to run the app
1. Clone this repository
2. `cd` into the cloned directory
3. Run `bundle` to install dependencies
4. Run `rackup`
5. Navigate to `http://localhost:9292/` in your browser

# How to run the tests
1. Clone this repository
2. `cd` into the cloned directory
3. Run `bundle` to install dependencies
4. Run `rspec`

# Questions to explore
* What is the difference in behaviour between this app and one which there is [no database](https://github.com/tatsiana-makers/count-sinatra)?
* Which of the MVC components interacts with the database?
* What parts of the code run when we run the app in our browser? You could test your assumption by adding `p` lines and checking that you see the output you expect.
* What part of the code runs when we click the "Increment" button?
* Can you add a "Decrement" button which decreases the count by 1 each time it is pressed?
* Can you update the app to display the time that the count was last updated? This value should be stored in the database so that it will be accurately displayed even if the server is restarted.

State of counter is stored independent of whether the user refreshes the page or the sever is closed.
Stored locally on machine in DB.

The Model / server / backend interacts with the database.
counter.rb and database_connection.rb both connect with the SQL database.
database_connection.rb - sets up the connection with PG and has a method which exec's SQL querys
counter.rb extracts the state of counter and updates it using SQL commands.

count_manager=# SELECT * FROM counter
count_manager-# ;
 id | count 
----+-------
  1 |    40

def count
  result = DatabaseConnection.query("SELECT * FROM counter WHERE id=1;")
  p result
  p result[0]
  result[0]['count'].to_i
end

#<PG::Result:0x00007f8b9d1159d8 status=PGRES_TUPLES_OK ntuples=1 nfields=2 cmd_tuples=1>
{"id"=>"1", "count"=>"42"}
