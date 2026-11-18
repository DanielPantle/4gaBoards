Feature: Login
  As a user
  I want to be able to log in
  So that I can access my projects and profile

Scenario Outline: login with invalid credentials
  Given the user has not logged in
  And the user has opened the login page
  When the user logs in with <username> as username and <password> as password
  Then the message "Invalid username or password" should be displayed on the login page

  Examples:
    | username | password |
    | demo1    | demo     |
    | demo     | demo1    |
    | demo1    | demo1    |

Scenario Outline: login with missing data
  Given the user has not logged in
  And the user has opened the login page
  When the users logs in with <username> as username and <password> as password
  Then the missing fields should be highlighted

  Examples:
    | username | password |
    |          |          |
    | demo     |          |
    |          | demo     |

Scenario: login with valid credentials
  Given the user has not logged in
  And the user has opened the login page
  When the user logs in with "demo" as username and "demo" as password
  Then the user should be logged in
  And the homepage should be displayed

Scenario: redirect from homepage to login page if user is not logged in
  Given the user has not logged in
  When the user opens the homepage
  Then the login page should be displayed

Scenario: redirect from login page to homepage if user is logged in
  Given the user has logged in
  When the user opens the login page
  Then the homepage should be displayed
