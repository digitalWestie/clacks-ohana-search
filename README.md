== Steps for deploying 'Clackskids'

i. Install gems

`bundle install`

ii. Create database

`rake db:create`
`rake db:migrate`

iii. Setup environment variables

Use `config/application.example.yml` to create an application configuration file called `application.yml` in `config/`. Refer to comments in `application.example.yml` for explanation of the settings.

When hosting on heroku use figaro to push these settings e.g.

`figaro heroku:set -e production`

iv. Set a new secret token

In `config/initializers/secret_token.rb`

Replace the alphanumeric token with a new one.

`Clackskids::Application.config.secret_key_base = '<my new token>'`

You can use `rake secret` to generate a new token.
