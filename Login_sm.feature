Scenario: To validate the login of a user

Given: That I am on the login page of the app
When: I enter the username as xxxx.gmail.com
And: I enter the password as yyyyy
And: I click the login button
Then: I should be redirected to the landing/home page of the application.