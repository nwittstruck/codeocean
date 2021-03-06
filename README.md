Code Ocean
==========

[![Build Status](https://travis-ci.org/openHPI/codeocean.svg?branch=master)](https://travis-ci.org/openHPI/codeocean)
[![Code Climate](https://codeclimate.com/github/openHPI/codeocean/badges/gpa.svg)](https://codeclimate.com/github/openHPI/codeocean)
[![Test Coverage](https://codeclimate.com/github/openHPI/codeocean/badges/coverage.svg)](https://codeclimate.com/github/openHPI/codeocean)
[![Dependency Status](https://gemnasium.com/openHPI/codeocean.svg)](https://gemnasium.com/openHPI/codeocean)

## Development Setup

### Mandatory Steps

- install the Docker client
- run `bundle install`
- create *config/action_mailer.yml*
- create *config/database.yml*
- create *config/secrets.yml*
- customize *config/docker.yml.erb*

Exemplary configuration files are available in the *config* directory.

In order to execute code submissions using Docker, source code files are written to the file system and are provided to a dedicated Docker container. These files are temporarily written to *Rails.root/tmp/files/*. Please make sure that *workspace_root* in *config/docker.yml.erb* corresponds to that directory or to a linked directory if using a remote Docker server.

### Optional Steps

- create *config/sendmail.yml*
- create *config/smtp.yml*
- if Docker is not supported by your OS, set up a local Docker server, for instance using [vagrant-docker](https://github.com/hklement/vagrant-docker)
- create seed data by executing `rake db:seed`

## Production Setup

- create production configuration files (*database.production.yml*, …)
- customize *config/deploy/production.rb* if you want to deploy using [Capistrano](http://capistranorb.com/)

The application is compatible with MRI and JRuby. Due to superior parallelism, we recommend using JRuby.
