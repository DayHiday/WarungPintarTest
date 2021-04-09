*** Settings ***
Resource        ../tests/keywordsGist.robot

Suite Setup             Open Gist
Suite Teardown          Close Browser

*** Test Cases ***
As a user, I want to create a public gist
	User add new public gist
	Displayed gist added

As a user, I want to edit an existing gist
	User edit an existing gist
	Displayed gist updated
	
As a user, I want to delete an existing gist
	User delete an existing gist
	Displayed list gist 	
	
As a user, I want to see my list of gists. 
	User click see all of your gists
	Displayed list all gist
