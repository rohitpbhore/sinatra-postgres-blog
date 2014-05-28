sinatra-postgres-blog
=====================

### Get It

The source code is managed with Git (a version control system) and hosted at GitHub.

You can download the app ("clone the repository") with the command

    $ git clone https://github.com/rohitpbhore/sinatra-postgres-blog.git


### Set Up the Database

You'll need to create postgres database and do respective changes in app.rb file

```
db = URI.parse('postgres://<PG_USER>:<password>@localhost/<DB_NAME>')
```

### Getting Started

Start the server

```
$ bundle exec rackup
```

and go to http://localhost:9292/
