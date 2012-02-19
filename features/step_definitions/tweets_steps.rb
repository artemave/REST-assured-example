require 'cgi'
require 'erubis'

Given /^there are the following popular tweets mentioning "([^"]*)":$/ do |query, table|
  @users      = table.hashes.clone
  template    = File.read(File.expand_path('../tweets.json.erb', __FILE__))
  tweets_json = Erubis::Eruby.new(template).result(users: @users)

  RestAssured::Double.create(
    fullpath: "/search.json?q=#{query}&result_type=popular",
     content: tweets_json
  )
end

When /^I view tweets page$/ do
  visit "/popular_tweets"
end

When /^I ask for popular tweets about "([^"]*)"$/ do |query|
  fill_in "query", with: query
  click_button "Search"
end

Then /^I should see those tweets$/ do
  wait_until { !page.evaluate_script(%{$('.loading').is(':visible')}) }

  all('#tweets tbody tr').count.should == @users.length

  all('#tweets tbody tr').each_with_index do |row, idx|
    row.find('.from_user').text.should          == @users[idx]['from_user']
    row.find('.profile_image img')[:src].should == @users[idx]['profile_image']
    row.find('.text').text.should               == CGI.unescapeHTML( @users[idx]['text'] )
    row.find('.date').text.should               == @users[idx]['date'][/[^+]*/].strip
  end
end
