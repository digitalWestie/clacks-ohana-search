# Clackskids

Inspired by [Ohana Web Search](http://github.com/codeforamerica/ohana-web-search), Clackskids is a mobile-friendly site for browsing and searching childcare and family support services. This application is a client facing front end for the services made available via the API from the [Clacks-Ohana](http://github.com/digitalwestie/ohana-api) application.

### Stack Overview

    Ruby version 2.1.2
    Rails version 4.1.6
    Database agnostic
    Testing Frameworks: Minitest

## Intall guide

*i. Install gems*

`bundle install`

*ii. Create database*

`rake db:create`
`rake db:migrate`

*iii. Setup environment variables*

Use `config/application.example.yml` to create an application configuration file called `application.yml` in `config/`. Refer to comments in `application.example.yml` for explanation of the settings.

When hosting on heroku use figaro to push these settings e.g.

`figaro heroku:set -e production`

*iv. Set a new secret token*

In `config/initializers/secret_token.rb`

Replace the alphanumeric token with a new one.

`Clackskids::Application.config.secret_key_base = '<my new token>'`

You can use `rake secret` to generate a new token.