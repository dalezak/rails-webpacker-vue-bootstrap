# Rails 6  
## Boilerplate for Webpacker, Vue, Bootstrap, FontAwesome

This is a boilerplate project sharing some tips and tricks for using Rails 6 with Webpacker, Vue, Bootstrap and FontAwesome.

#### Init Rails Project
First create a new Rails project with options to use Git, Postgres as a database and Vue for the frontend framework.
```
rails new starter --git --skip-sprockets --webpack=vue --database=postgresql
```

#### Add Server Gems
```
bundle add puma
bundle add puma_worker_killer
```

#### Add Frontend Gems
```
bundle add webpacker
bundle add turbolinks
bundle add jbuilder
```

#### Add Model Gems
```
bundle add paranoia
bundle add annotate
```

#### Add Database Gems
```
bundle add rails-erd
```

#### Add Authentication Gems
```
bundle add devise
bundle add devise-jwt
```

#### Add Authorization Gems
```
bundle add cancancan
```

#### Add Worker Gems
```
bundle add delayed_job
bundle add delayed_job_active_record
```

#### Add Mail Gems
```
bundle add mail
bundle add sendgrid
bundle add sendgrid-ruby
```

#### Add Configuration Gems
```
bundle add figaro
```

#### Add Seed Gems
```
bundle add faker
```

#### Add HTTP Gems
```
bundle add httparty
bundle add nokogiri
bundle add simple-rss
bundle add sitemap_generator
```

#### Add Security Gems
```
bundle add rack-cors
bundle add rack-attack
bundle add rack-timeout-puma
```

#### Add Development Gems
```
bundle add bullet
bundle add brakeman
bundle add memory_profiler
bundle add derailed_benchmarks
bundle add byebug
bundle add rubocop
bundle add better_errors
bundle add binding_of_caller
bundle add rack-mini-profiler
```

#### Update Gems
```
bundle install
bundle update
```

#### Add Node Packages
Next add some node packages we'll use on the frontend.
```
yarn add webpack webpack-cli pnp-webpack-plugin
yarn add turbolinks rails-ujs activestorage
yarn add jquery bootstrap popper.js
yarn add colcade vue-colcade
yarn add axios vue-axios vue-turbolinks
yarn add @fortawesome/fontawesome-free @fortawesome/fontawesome-svg-core @fortawesome/free-regular-svg-icons
```

#### Config Webpacker Packs
```
rails webpacker:install:erb
rails webpacker:install:typescript
```

#### Setup Database
```
bundle exec rake db:create
bundle exec rake db:migrate
```

#### Setup Authentication
```
rails generate devise:install
```

#### Setup Authorization
```
rails generate cancan:ability
```

#### Setup Configuration
```
bundle exec figaro install
```

#### Setup Jobs
```
rails generate delayed_job:active_record
```

#### Add Procfile File
```
web: bundle exec puma -C config/puma.rb
```

#### Add Profile.dev File
```
web: bundle exec rails s -p 3000 -b lvh.me
webpack: ./bin/webpack-dev-server
```

#### Add GitHub Templates
*.github/ISSUE_TEMPLATE/bug-report.md*
```
---
name: Bug Report
about: Report something that is broken or not working as intended
title: ''
labels: 'Type: Bug'
assignees: ''
---

#### Expected Behaviour

#### Actual Behaviour

#### Steps to Reproduce
-

```
*.github/ISSUE_TEMPLATE/feature-request.md*
```
---
name: Feature Request
about: Suggest an idea for a new feature or enhancement to existing features
title: ''
labels: 'Type: Feature'
assignees: ''
---

#### Describe Problem

#### Suggest Solution

#### Additional Details

```
*.github/ISSUE_TEMPLATE/code-maintenance.md*
```
---
name: Code Maintenance
about: Project cleanup, improve documentation, refactor code
title: ''
labels: 'Type: Maintenance'
assignees: ''
---

#### Describe Problem

#### Suggest Changes

#### Provide Examples

```

#### Generate DB Diagram
```
brew install graphviz
bundle exec rails g erd:install
```

#### Overwrite Rails Templates
```
mkdir -p lib/templates/rails/scaffold_controller && cp $(bundle show jbuilder)/lib/generators/rails/templates/* lib/templates/rails/scaffold_controller
mkdir -p lib/rails/generators/erb/scaffold && cp $(bundle show railties)/lib/rails/generators/erb/scaffold/scaffold_generator.rb lib/rails/generators/erb/scaffold/
```

#### Generate Landing Pages
```
rails generate controller Pages index --no-javascripts --no-stylesheets --no-helper --no-assets --no-fixture
```

#### Reset Database
```
rake db:drop
rake db:create
rake db:migrate
rake db:reset
```

#### Generate DB Diagram
```
bundle exec erd
```

#### Run Code Audits
```
rubocop
brakeman
rails-audit
```

#### Generate Model Annotations
```
annotate --models
annotate --routes
```

#### Update Yarn Packages
```
rm -rf node_modules
rm -f yarn.lock
yarn install
```

#### Create Pull Request
```
ISSUE_NAME="123 Fixed A Bug"
BRANCH_NAME=$(echo $ISSUE_NAME | tr '[:upper:]' '[:lower:]' | tr '/' '-' | tr ' ' '-')
git checkout -b $BRANCH_NAME
git add .
git add -u
git commit -m "Fixed a bug for #123"
git push -u origin $BRANCH_NAME
```

#### Create Release Tag
```
TAG_NAME=`date "+%Y-%m-%d_%H-%M-%S"`
git tag -a $TAG_NAME -m $TAG_NAME
git push origin --tags
```

#### Create Vue Helpers
```
rails g vue something --single
rails g vue something --single --state
vue g component_name --form
vue g component_name --vuex
rails vue:i18n
rails vue:translate
rails vue:store
```

#### Run Local Environment
```
foreman start -f Procfile.dev
```

#### Edit Rails Credentials
```
EDITOR="vim" bin/rails credentials:edit
```

