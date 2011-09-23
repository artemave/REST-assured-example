Given /^there exist the following popular tweets mentioning "([^"]*)":$/ do |query, table|
  @query = query
  @users = []
  table.hashes.each do |row|
    @users << row
  end
end

When /^I view popular tweets page$/ do
  visit "/popular_tweets"
end

When /^I ask for popular tweets about "([^"]*)"$/ do |query|
  fill_in "search", query
  click_button "search"
end

Then /^I should see the following list of tweets:$/ do |table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end
