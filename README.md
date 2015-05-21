## README

A 20% time discovery tool. More to come soon.

## Installation

The installation process is a little bit involved, so here is a handy guide to get you started.

Clone the repo using ``` git clone```.
Navigate to the repo and install RVM and PostgreSQL.  
Then, using terminal install Ruby using RVM.  You'll need Ruby version 2.2.0, so you''ll install that version using the command ```rvm install ruby-2.2.0```
Then you need to run a series of commands to prep the repo for Rails, use 
```
gem install bundle
```
and
```
bundle install
```

Now we need to create an appropriate user in the Postgres database. Try running ``` rake s``` to see why.  To do this, open up Postgres in terminal using ```psql``` or the GUI. Then remove any possible user ```root``` with the command ```DROP USER root```.  Then re-add the user root with appropriate permissions using the command 
```createuser 'root' PASSWORD '123456' CREATEDB SUPERUSER```

Type ```\du``` to ensure that there exists a user ```root``` with permissions ```Superuser```, and ```CreateDB```.

Then we need to create the database, so we input the following commands (into terminal)

```
rake db:create
```
followed by 
```
rake db:migrate
```

You should now be ready to develop!
