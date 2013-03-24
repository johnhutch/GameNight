Game Night!
===========

Game Night is a Web application for planning, tracking, and maintaining your weekly or monthly board game nights.

Things to do on Game Night:
---------------------------

* Sign up!
* Check out your dashboard
* Create a new "Game Night"
* Manage your game collection
    * Add games
    * Removes games
* Manage your friends
    * Add friends
    * Search for friends
    * Review your friends list
* Manage Game Nights
    * Blog about a Game Night
    * Comment on posts about a Game Night
    * Invite friends to a Game Night
    * View all games availabe for a Game Night

Current version: Rails 3.2.8

Things to do after cloning GameNight
--------------------------------------------

* rake db:migrate and rake db:migrate RAILS_ENV="test"
* guard
* Update initial settings in /config/settings.yml and each setting file in /config/settings/*.yml


DEVELOPMENT TO DO
-----------------

* Auto-delete game night if user is the last person to leave
* AJAXy add-players functionality where a user clicks to highlight any of their friends they want to add to the game night, then click submit to add them all at once.
* Set up ability to refuse or ignore being added to game nights
* Add ability to ignore players
