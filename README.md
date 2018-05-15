## Bookmark Manager

Task:
-----

We are going to write a bookmark manager application that allows users to save urls of websites that they want to store, so that they can look at them and use them when required. The aim of this weekly challenge was to gain a greater knowledge of databases and how they fit into the request/response cycle of a web application. This was done using Ruby for the model, Sinatra for the application framework, capybara/RSPec for the testing, and PostgreSQL for the database management.

Approach:
---------

The approach was to establish an initial database that would store a bookmark, which would have id, title, and a url columns. These columns would form the basis for the Bookmark class logic.

The aim was to be able to set up an ORM, which would allow the sinatra application to talk to the database, and update it with data supplied by the client. Although this challenge was not 100% completed, it provided a firm foundation for my knowledge of database - application relationships, knowledge that was solidified with the Chitter weekend challenge.

User stories:
-------------

```sh

As a user
So that I can see my bookmarks
I would like to be able to view a list

As a user
So that I can save new urls I find
I would like to be able to add to the list

As a user
So that I can remove urls I no longer need
I would like to be able to remove from the list

As a user
So that I can alter my bookmarks
I would like to be able to update my bookmarks

As a user
So that I can feedback on my friend\'s bookmarks
I would like to be able to add comments on links

As a user
So that I can categorise my bookmarks
I would like to be able to add tags to them

As a user
So that I can find bookmarks based on my interests
I would like to be able to filter bookmarks based on tags

As a user
So that I have control over my bookmarks
I would like to have an easy interface to manage all this

```

Instructions:
-------------

Instructions:
------------
Run
```sh
bundle install
```

Use rackup to open the app in the web browser
```sh
rackup config.ru
```

Enter the local-host into your web browser to start the game
```sh
http://localhost:9292
```
