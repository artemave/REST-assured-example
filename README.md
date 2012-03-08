## REST Assured example

Sample app that uses [REST Assured](https://github.com/BBC/REST-assured) for its integration testing. It implements a page where user can query twitter for popular tweets that match search term.

## Usage

This is a Sinatra based application so you need ruby (>= 1.9.2) installed.

Install app:

    $ git clone git://github.com/artemave/REST-assured-example.git
    $ cd REST-assured-example
    $ bundle install # gem install bundler if it is not there yet

Run app with twitter stubbed out:
    
    $ TWITTER_HOST=http://localhost:4578 bundle exec ruby tweet_checker.rb

Run tests:

    $ bundle exec cucumber

## Author

[Artem Avetisyan](https://github.com/artemave)
