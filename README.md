# MYMONEY

This is my answer for the LeMoney challenge test.
It was build using:
 * Ruby 2.7.2
 * Postgresql Sever 10
 * Docker Engine 20.10.2
## Configuration
  `$ docker-compose up -d`

## Setup Databases
Just run: 
- `$ rake db:create db:migrate`
## Running tests
Just execute:
- `$ bundle exec rspec`

## Running system on localhost
On terminal type the following command:
- `$ rails s`

Open your browser on http:://localhost:3000/ for user interface and open http://localhost:3000/admin for admin interface

Thanks