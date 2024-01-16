# README
## Setup Instructons
1. Clone git repository
2. Navigate to the directory
  - `cd rssarticlereader`
3. Install dependencies
  - `bundle install`
4. Run the following commands to set up the database
  - `rails db:create`
  - `rails db:migrate`
  - `rails db:seed` - this command is responsible for calling the rss api https://rss.slashdot.org/Slashdot/slashdotMain and loading the database.
4. Start the server locally
  - `rails s`
5. Navigate to http://localhost:3000

## Tests
1. `rails test`

## Assumptions / Decisions
1. Retrieving Rss feed info only once at database setup, not reloading/refreshing on each server start or page load.
2. Some fields less important to show on UI (e.g. subject)
3. User might like to filter on read/unread articles - so I added a url param and a toggle on the UI.
4. Added bootstrap library to improve UI / speed up UI development.
