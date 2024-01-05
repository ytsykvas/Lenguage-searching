# Programming Languages Search Project

This project, built on the Ruby on Rails framework, aims to facilitate the search and filtering of information about programming languages stored in JSON format.

## Requirements

- Implementation must use Ruby, JavaScript and HTML (all three). You can use rails views for this.
- Search logic should be implemented in Ruby and written by YOU, don't use a gem or external code for this
- Use Ruby 3.х, Rails 7.х (or-non-rails), Trailblazer 2.х (if you are familiar)
- A search for Lisp Common should match a programming language named "Common Lisp"
- Writing code with reusability in mind
- Search match precision
- Search results ordered by relevance
- Support for exact matches, eg. Interpreted "Thomas Eugene", which should match "BASIC", but not "Haskell"
- Match in different fields, eg. Scripting Microsoft should return all scripting languages designed by "Microsoft"
- Support for negative searches, eg. john -array, which should match "BASIC", "Haskell", "Lisp" and "S-Lang", but not "Chapel", "Fortran" or "S".
- Solution elegance
- Visual design

## Technologies

- Ruby 3.2.2
- Rails 7.1.2

## Installation

1. Clone the repository to your local machine:

   ```bash
   git clone git@github.com:ytsykvas/Lenguage-searching.git

2. Install dependencies:


   ```bash
   bundle install

3. Start the Rails server:


   ```bash
   rails server

4. Open a web browser and go to http://localhost:3000 to use the application.

## Dependencies
- Rails 7.1.2: Web framework for development.
- puma: Web server.
- importmap-rails: Import map for JavaScript.
- jbuilder: Building JSON APIs.
- bootstrap, sassc-rails: Styling.
- slim-rails: SLIM views.
- rubocop: Code cleanliness.
- jquery-rails: jQuery for JavaScript.
- kaminari, will_paginate: Pagination.
- rspec-rails for test coverage.

## Running Tests
All cases specified in the project task are covered by the tests.
To run RSpec tests, use the following command:

   ```bash
   bundle exec rspec
