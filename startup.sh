#!/bin/bash
#Startup scripts
bundle install
rm -f /lab02/tmp/pids/server.pid
rails db:create
rails db:migrate
rails db:seed
rails s -b 0.0.0.0