## Secret Messages Service

Web application creates a text self-destructing messages.

Technologies uses: Sinatra, Sidekiq, ActiveRecord and AES

Demo — http://secretletter.herokuapp.com/


use `./bin/console` to open console

use `./bin/server` to run web server

use `brew install redis` to install Redis

use `foreman start -f Procfile.dev` to start web server and Sidekiq for development

use `rake db:create` to create db

use `rake db:migrate` to migrate db
