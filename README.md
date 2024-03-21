# Viewing Party Solo - Base Repo

This is the base repo for the [Viewing Party Solo project](https://backend.turing.edu/module3/projects/viewing_party_solo) used for Turing's Backend Module 3.

### About this Project

Viewing Party Solo is an application that allows users to explore movies and create a Viewing Party Event that invites users and keeps track of a host. Mainly, your job is to connect with an external API and collect relevant information on each movie, its cast, and other information, to display it on each Viewing Party page. 

## Setup

1. Fork and Clone the repo
2. Install gem packages: `bundle install`
3. Setup the database: `rails db:{create,migrate,seed}`

Spend some time familiarizing yourself with the functionality and structure of the application so far. 

When you run `bundle exec rspec`, you should have 26 passing tests (both features & models combined). 

### Use the application
`rails s`, navigate to `127.0.0.0:3000` and click around the site. 


## Versions

- Ruby 3.2.2

- Rails 7.1.2

Example wireframes to follow are found [here](https://backend.turing.edu/module3/projects/viewing_party_solo/wireframes)

## Project Specs
1. Discover Movies: Search by Title
As a user,
When I visit the '/users/:id/discover' path (where :id is the id of a valid user),
I should see
- a Button to Discover Top Rated Movies
- a text field to enter keyword(s) to search by movie title
- a Button to Search by Movie Title

2. Movie Results Page
When I visit the discover movies page ('/users/:id/discover'),
and click on either the Discover Top Rated Movies button or fill out the movie title search and click the Search button,
I should be taken to the movies results page (`users/:user_id/movies`) where I see: 

- Title (As a Link to the Movie Details page (see story #3))
- Vote Average of the movie

I should also see a button to return to the Discover Page.
