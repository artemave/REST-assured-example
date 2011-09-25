require 'erb'
require 'cgi'
require 'rest-client'

Given /^there are the following popular tweets mentioning "([^"]*)":$/ do |query, table|
  @query = query
  @users = []
  table.hashes.each do |row|
    @users << row
  end

  tweets_json = ERB.new( File.read(File.expand_path('../tweets.json.erb', __FILE__)) ).result(binding)

  RestClient.post "#{stub_server_host}/doubles",
    :fullpath => "/search.json?q=#{query}&result_type=popular",
    :content => tweets_json
end

When /^I view tweets page$/ do
  visit "/popular_tweets"
end

When /^I ask for popular tweets about "([^"]*)"$/ do |query|
  fill_in "query", :with => query
  click_button "Search"
end

Then /^I should see those tweets$/ do
  find('.loading').should_not have_content('loading...')

  all('#tweets tbody tr').count.should == @users.length

  all('#tweets tbody tr').each_with_index do |row, idx|
    row.find('.from_user').text.should == @users[idx]['from_user']
    row.find('.profile_image img')[:src].should == @users[idx]['profile_image']
    row.find('.text').text.should == CGI.unescapeHTML( @users[idx]['text'] )
    row.find('.date').text.should == @users[idx]['date'][/[^+]*/].strip
  end
end
