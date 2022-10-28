# Capistrano Cloudwatch [![Build Status](https://app.travis-ci.com/olioex/capistrano-cloudwatch.svg)](https://app.travis-ci.com/olioex/capistrano-cloudwatch) [![Gem Version](https://badge.fury.io/rb/capistrano-cloudwatch.svg)](http://badge.fury.io/rb/capistrano-cloudwatch)

Publish metric for successful deploy to AWS CloudWatch - for [Capistrano v3](https://github.com/capistrano/capistrano).

## Installation

Add this line to your application's Gemfile:

    gem 'capistrano-cloudwatch', require: false

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano-cloudwatch

## Usage

Require the gem in your `Capfile`:

    require 'capistrano/cloudwatch'

And then set the variables in `config/deploy.rb`:

    set :application, 'olioex'
    set :project, 'core-api'   # optional!

The task will run automatically on successful deploy. Alternatively, you can notify of a deploy starting manually by using:

    bundle exec cap production deploy:log_to_cloudwatch

The namespace for the metric will be:

    Deployment

The metric will have the name of the Capistrano application.

The metrics have two dimensions:
* environment
* project (if set)

### Copyright

Copyright (c) 2022 OLIO Exchange Ltd. See LICENSE.txt for further details.
