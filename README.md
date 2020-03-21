# Rails 6  
## Boilerplate for Webpacker, Vue, Bootstrap, FontAwesome

This is a boilerplate project sharing some tips and strategies for using Rails 6 with Webpacker, Vue, Bootstrap and FontAwesome.

#### Init Rails Project
First create a new Rails project with options to use Git, Postgres as a database and Vue for the frontend framework.
```
rails new starter --git --skip-sprockets --webpack=vue --database=postgresql
```

#### Add Procfile File
```
web: bundle exec puma -C config/puma.rb
```

#### Add Profile.dev File
```
web: bundle exec rails s -p 3000 
webpack: ./bin/webpack-dev-server
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

#### Add Frontend Gems
```
bundle add js-routes
bundle add vueonrails
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
yarn add jquery bootstrap popper.js css-loader
yarn add colcade vue-colcade
yarn add axios vue-axios vue-turbolinks
yarn add @fortawesome/fontawesome-free @fortawesome/fontawesome-svg-core @fortawesome/free-regular-svg-icons
yarn add titleize pluralize humanize-string
yarn add moment moment-timezone vue-moment
yarn add vue-cancan vue-form-for
yarn add tempusdominus-core tempusdominus-bootstrap-4
```

#### Enable Sprockets Railtie
In `config/application.rb`, uncoment
```
require "sprockets/railtie"
```

#### Enable Subfolder Models
In `config/application.rb`, add these lines to allow subfolders to be loaded
```
config.autoload_paths += Dir[Rails.root.join('app', 'jobs', '**/')]
config.autoload_paths += Dir[Rails.root.join('app', 'models', '**/')]
config.autoload_paths += Dir[Rails.root.join('app', 'mailers', '**/')]
```

#### Add ERB Webpacker
Enable ERB on our frontend so we can dynamically load javascript, stylesheets, images
```
rails webpacker:install:erb
```

#### Add ERB Indexes
Add `app/javascript/components/index.js.erb`
```
import Vue from 'vue/dist/vue.esm';
<% vues = Rails.application.root.join('app', 'javascript', 'components', '**', '*.vue') %>
<% Dir.glob(vues).each do |path| %>
  <% component = File.basename(path, ".vue") %>
  import <%= component.underscore.camelize %> from "<%= path %>";
  Vue.component("<%= component.underscore.dasherize %>", <%= component.underscore.camelize %>);
<% end %>
```
Add `app/javascript/filters/index.js.erb`
```
import Vue from 'vue/dist/vue.esm';
<% filters = Rails.application.root.join('app', 'javascript', 'filters', '**', '*.js') %>
<% Dir.glob(filters).each do |path| %>
  <% filter = File.basename(path, ".js") %>
  import <%= filter.underscore.camelize %> from "<%= path %>";
<% end %>
```
Add `app/javascript/javascripts/index.js.erb`
```
<% javascripts_glob = Rails.application.root.join('app', 'javascript', 'javascripts', '**', '*.js') %>
<% Dir.glob(javascripts_glob).each do |file| %>
  import '<%= file %>';
<% end %>
```
Add `app/javascript/images/index.js.erb`
```
<% images = Rails.application.root.join('app', 'javascript', 'images', '**', '*.{png,svg,jpg}') %>
<% Dir.glob(images).each do |image| %>
  import '<%= image %>';
<% end %>
```
Add `app/javascript/stylesheets/index.js.erb`
```
<% stylesheets = Rails.application.root.join('app', 'javascript', 'stylesheets', '**', '*.{css,scss}') %>
<% Dir.glob(stylesheets).each do |file| %>
  import '<%= file %>';
<% end %>
```
Add `app/javascript/routes/index.js.erb` 
```
<%= JsRoutes.generate() %>
```

#### Update Webpacker Environment
Update `config/webpack/environment.js`
```
const { environment } = require('@rails/webpacker')
const { VueLoaderPlugin } = require('vue-loader')
const vue = require('./loaders/vue')
const erb = require('./loaders/erb')
const webpack = require('webpack')
environment.plugins.append('Provide', new webpack.ProvidePlugin({
  $: 'jquery',
  jquery: 'jquery',
  jQuery: 'jquery',
  'window.jQuery': 'jquery',
  Popper: ['popper.js', 'default'],
  moment: 'moment'
}))
environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin())
environment.loaders.prepend('vue', vue)
environment.loaders.prepend('erb', erb)
module.exports = environment
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

- `lib/templates/erb/scaffold/index.html.erb.tt`
```
<ol class="breadcrumb">
  <li class="breadcrumb-item active mr-auto"><%= plural_table_name.capitalize %></li>
</ol>
<div class="card-columns">
  <%% @<%= plural_table_name %>.each do |<%= singular_table_name %>| %>
    <div class="card card mb-4 shadow-sm">
      <div class="card-body">
        <h5 class="card-title"><%%= link_to <%= singular_table_name %>.to_s, <%= model_resource_name %> %></h5>
        <p class="card-text"><%%= <%= singular_table_name %>.created_at %></p>
      </div>
    </div>
  <%% end %>
</div>
``` 

- `lib/templates/erb/scaffold/show.html.erb.tt`
```
<ol class="breadcrumb">
  <li class="breadcrumb-item"><%%= link_to "<%= plural_table_name.capitalize %>", <%= index_helper %>_path %></li>
  <li class="breadcrumb-item active mr-auto"><%%= @<%= singular_table_name %>.id %></li> 
</ol>
<div class="card shadow-sm">
  <ul class="list-group list-group-flush">
<% attributes.reject{|a| a.name == 'type' || a.name == 'deleted_at' || a.name == 'password_digest'}.each do |attribute| -%>
    <li class="list-group-item">
      <p class="font-weight-bold"><%= attribute.human_name %></p>
      <p class="font-weight-normal"><%%= @<%= singular_table_name %>.<%= attribute.name %> %></p>
    </li>
<% end -%>
  </ul>
</div>
```

- `lib/templates/erb/scaffold/new.html.erb.tt`
```
<ol class="breadcrumb">
  <li class="breadcrumb-item"><%%= link_to "<%= plural_table_name.capitalize %>", <%= index_helper %>_path %></li>
  <li class="breadcrumb-item active">Add</li>
</ol>

<%%= render 'form', <%= singular_table_name %>: @<%= singular_table_name %> %>
```

- `lib/templates/erb/scaffold/edit.html.erb.tt`
```
<ol class="breadcrumb">
  <li class="breadcrumb-item"><%%= link_to "<%= plural_table_name.capitalize %>", <%= index_helper %>_path %></li>
  <li class="breadcrumb-item"><%%= link_to @<%= singular_table_name %>.id, @<%= singular_table_name %> %></li>
  <li class="breadcrumb-item active">Edit</li>
</ol>

<%%= render 'form', <%= singular_table_name %>: @<%= singular_table_name %> %>
```

- `lib/templates/erb/scaffold/_form.html.erb.tt`
```
<%% if <%= singular_table_name %>.errors.any? %>
  <%% <%= singular_table_name %>.errors.full_messages.each do |message| %>
  <div class="alert alert-danger" role="alert">
    <%%= message %>
  </div>
  <%% end %>
<%% end %>
<%%= form_with(model: <%= model_resource_name %>, local: true) do |form| -%>
<div class="card shadow-sm">
  <ul class="list-group list-group-flush">
<% attributes.reject{|a| a.name == 'type' || a.name == 'deleted_at' || a.name.end_with?("_count")}.each do |attribute| -%>
    <li class="list-group-item">
      <div class="form-group">
<% if attribute.password_digest? -%>
        <%%= form.label :password, class: "font-weight-bold" %>
        <%%= form.password_field :password, placeholder: "Enter password", class: "form-control" %>
        <%%= form.label :password_confirmation, class: "font-weight-bold" %>
        <%%= form.password_field :password_confirmation, placeholder: "Enter password confirmation", class: "form-control" %>
<% else -%>
        <%%= form.label :<%= attribute.column_name %>, class: "font-weight-bold" %>
        <%%= form.<%= attribute.field_type %> :<%= attribute.column_name %>, placeholder: "Enter <%= attribute.column_name %>", class: "form-control" %>
<% end -%>
      </div>
    </li>
<% end -%>
  </ul>
  <div class="card-footer">
    <%%= link_to "Cancel", <%= model_resource_name %>, class: 'btn btn-outline-secondary float-left' if <%= singular_table_name %>.persisted? %>
    <%%= link_to "Cancel", <%= index_helper %>_path, class: 'btn btn-outline-secondary float-left' if !<%= singular_table_name %>.persisted? %>
    <%%= form.submit "Save", class: "btn btn-primary float-right" if <%= singular_table_name %>.persisted? %>
    <%%= form.submit "Create", class: "btn btn-primary float-right" if !<%= singular_table_name %>.persisted? %>
  </div>
</div>
<%% end %>
```

#### Generate Landing Pages
```
rails generate controller Pages index --no-javascripts --no-stylesheets --no-helper --no-assets --no-fixture
```

#### Generate Scaffold Models
```
rails generate devise User type:string name:string initials:string deleted_at:datetime --force --no-javascripts --no-stylesheets --no-helper --no-assets

rails generate scaffold Step type:string name:string description:text ordinal:integer deleted_at:datetime --force --no-javascripts --no-stylesheets --no-helper --no-assets
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

