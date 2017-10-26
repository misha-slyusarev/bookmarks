# Bookmarks

Small application to keep your URLs as bookmarks. This is a showcase application.

*Main window*
![Main window](/public/main_window.png?raw=true "Main window")

*Edit window*
![Edit window](/public/edit_window.png?raw=true "Edit window")

*Show window*
![Show window](/public/show_window.png?raw=true "Show window")

## Run

To run application unpack and do following from within the application folder:
```
bundle install
rake db:migrate
rake db:seed
rails s
```
Navigate to http://localhost:3000 and play around.

## Contribution

Run the specs like this:
```
rspec spec
```

Check `db/seeds.rb` to see how can you create a bookmark from the console. Main application logic can be found inside `BookmarksController`.
