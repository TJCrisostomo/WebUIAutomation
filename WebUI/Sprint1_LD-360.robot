*** Settings ***
Documentation    A test suite for testing Sprint 1:  LD-360: Assets: Games landing page

Resource          PageResource.robot
Resource          Resource.robot

Suite Setup       Run Keywords		Open Page 

*** Variables ***
${invalidEmail}                               invalidEmail
${validEmail}                                 valid@Email.com

*** Test Cases ***

LD360-01
	Wait Until Element Is Visible                ${pageLogo}
	Click Element                                ${leftNavigationGamesEn}
	Wait Until Element Is Visible                ${gamesSubmitButton}  
	Element Should Contain                       ${pageIntro}                Let's make it more exciting. More games coming soon.
	Page Should Contain Element                  ${gamesPageImage}
	Page Should Contain Element                  ${gamesSubmitButton} 
	Page Should Contain Element                  ${gamesInputEmail}
 
 LD360-02
    Click Element                                ${pageLogo}
   	Wait Until Element Is Visible                ${leftNavigationGamesEn}
   	Click Element                                ${leftNavigationGamesEn}
	Wait Until Element Is Visible                ${gamesSubmitButton}
	Click Element                                ${gamesSubmitButton}
	Element Should Contain                       ${gamesEmailErrorValidation}      Email address is required.     

LD360-03
    Click Element                                ${pageLogo}
   	Wait Until Element Is Visible                ${leftNavigationGamesEn}
   	Click Element                                ${leftNavigationGamesEn}
	Wait Until Element Is Visible                ${gamesSubmitButton}
	Input Text                                   ${gamesInputEmail}                ${invalidEmail}
	Click Element                                ${gamesSubmitButton}
	Element Should Contain                       ${gamesEmailErrorValidation}      Please submit a valid email address.
	
LD360-04
    Click Element                                ${pageLogo}
   	Wait Until Element Is Visible                ${leftNavigationGamesEn}
   	Click Element                                ${leftNavigationGamesEn}
	Wait Until Element Is Visible                ${gamesSubmitButton}
	Input Text                                   ${gamesInputEmail}                ${validEmail} 
	Click Element                                ${gamesSubmitButton}

	                 