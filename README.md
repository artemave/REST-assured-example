## REST Assured example

Sample app that uses [REST-assured](https://github.com/BBC/REST-assured) in its integration testing (cucumber). It implements a page where user can query twitter for popular tweets that match search term.

## Usage

This is a Sinatra based application so you need ruby (>= 1.9.2) installed.

Install app:

    $ git clone git://github.com/artemave/REST-assured-example.git
    $ cd REST-assured-example
    $ bundle install # gem install bundler if it is not there yet
    $ ./tweet_checker # then visit http://localhost:4567/popular_tweets

Run app with twitter stubbed out:
    
    $ TWITTER_HOST=http://localhost:4578 ./tweet_checker

Then run tests:

    $ bundle exec cucumber # in separate shell

## Author

[Artem Avetisyan](https://github.com/artemave)
