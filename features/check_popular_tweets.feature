Feature: Check popular tweets
  In order to know latest hot news about things I am interested in
  As an internet user
  I want to be able to get most popular tweets about anything

  Scenario: Get tweets
    Given there are the following popular tweets mentioning "Obama":
      | from_user       | profile_image                                                                     | date                            | text                                                                                                                                                |
      | SteveMartinToGo | http://a2.twimg.com/profile_images/1278471358/semiSmilePUB_normal.jpg             | Tue, 20 Sep 2011 04:10:50 +0000 | I don't mind Obama's Buffet tax because I never eat at a buffet.                                                                                    |
      | jesseclee44     | http://a1.twimg.com/profile_images/1366014303/wedding_profile4_cropped_normal.png | Tue, 20 Sep 2011 13:22:19 +0000 | Obama: &quot;patriotic Americans...will no longer have to lie about who they are in order to serve the country they love&quot; http://t.co/LfWc3gV1 |
      | BarackObama     | http://a1.twimg.com/profile_images/1400727240/o2012_twitter_normal.jpg            | Mon, 19 Sep 2011 19:29:29 +0000 | 'This is not class warfare. It’s math.' —President Obama, proposing the Buffett Rule today: http://t.co/fxoLEJEb                                   |
    When I view tweets page
    And I ask for popular tweets about "Obama"
    Then I should see those tweets
