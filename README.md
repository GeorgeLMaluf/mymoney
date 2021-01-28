# MYMONEY

This is my answer for the LeMoney challenge test.
It was build using:
 * Ruby 2.7.2
 * Postgresql Sever 10
 * Docker Engine 20.10.2
## Configuration
On localhost:
  - Change the docker-compose.yaml and comment the mymoney service and save the file
  - `$ docker-compose up -d`

Using docker:
  - `$ docker-compose build mymoney`

## Setup Databases
On localhost:
  - Edit the .env file and uncomment the POSTGRES_HOST constant and save
  - Run the following line:
    * `$ rake db:create db:migrate`

Using docker:
  - Execute the following command:
    * `$ docker-compose run mymoney rake db:create db:migrate`
## Running tests
On localhost:
  - Execute:
    * `$ bundle exec rspec`

Using docker:
  - Use
    * `$ docker-compose run mymoney bundle exec rspec`
## Running system on localhost
On localhost:
  - On terminal type the following command:
    * `$ rails s`

Using docker:
  - Run:
    * `$ docker-compose up -d`


Open your browser on http://localhost:3000/ for user interface

Open your browser on http://localhost:3000/admin for admin interface

Thanks
