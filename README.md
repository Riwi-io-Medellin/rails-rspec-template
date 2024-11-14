# README

This document outlines the steps for setting up a Rails application with RSpec for testing, along with configuring environment variables, running tests, and checking code coverage.

Steps:

1. Create a new Rails application
```bash
     rails new rspec-riwi --css tailwind -d postgresql --skip-test --skip-jbuilder
```
2. Add required gems to your Gemfile
* Agregar gems
```bash
    group :development, :test do
        # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
        gem "debug", platforms: %i[ mri mingw x64_mingw ]
        # enviroments variables
        gem 'dotenv', '~> 3.1', '>= 3.1.4'
        # rspec-rails integrates the Rails testing helpers into RSpec.
        gem 'rspec-rails', '~> 7.1'
        gem 'rails-controller-testing', '~> 1.0', '>= 1.0.5'
        # Code coverage for Ruby with a UI
        gem 'simplecov', '~> 0.22.0'
    end
```
    * Description: Add the necessary gems for development and testing:
    * debug for debugging Rails applications.
    * dotenv to manage environment variables.
    * rspec-rails for integrating RSpec with Rails.
    * rails-controller-testing to allow controller tests in RSpec.
    * simplecov to track code coverage with a UI.

3. Run bundle install
```bash
    bundle install
```

4. Add environment variables and configure the database
Description: Create a .env file in the root of your project to store environment variables such as database credentials or secret keys. Ensure your config/database.yml is correctly configured to use PostgreSQL.

5. Run the database setup command
```bash
    rake db:create
```

6. Generate a scaffold for the FormEntry model
```bash
   rails generate scaffold FormEntry name:string age:integer email:string phone:string birthdate:date notes:text
```

7. Run the database migration

```bash
    rake db:migrate
```
8. Install RSpec

```bash
    rails generate rspec:install
```
9. Configure the rails_helper.rb file and create the necessary folders for models and controllers
Description: Customize the rails_helper.rb file to configure RSpec with any necessary setup for testing models, controllers, and other parts of your application. Ensure you have directories such as spec/models and spec/controllers for organizing your tests.

10. Run the tests with RSpec
```bash
    bundle exec rspec
```

Description: This command runs all the RSpec tests in the project. You can also specify the location of a specific test file, for example:
```bash
    bundle exec rspec spec/features/events_spec.rb
```
This runs only the tests in the specified file.


11. Review the test coverage
Description: After running your tests, you can check the code coverage by opening the coverage/index.html file in your browser. This file will display a report showing how much of your code is covered by tests.
