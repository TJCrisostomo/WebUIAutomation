*** Settings ***
Documentation    An Automated test suite for Web UI Verification Testing using Selenium, RobotFramework and Python

Resource          PageResource.robot
Resource          Resource.robot

Suite Setup       Run Keywords		Open Page 
Suite Teardown    Close All Browsers

*** Test Cases ***
Web Page: Home Page
	Wait Until Element Is Visible                ${pageLogo}
	Page Should Contain Element                  ${homePageImage} 
	Page Should Contain Element                  ${pageLogo}
	Page Should Contain Element                  ${langSelectorCN}
	Page Should Contain Element                  ${langSelectorTW}
	Page Should Contain Element                  ${langSelectorEN}
    Page Should Contain Element                  ${loginButton}
	Page Should Contain Element                  ${joinNowButton}
	Element Should Contain                       ${leftNavigationHomeEn}              Home
	Element Should Contain                       ${leftNavigationLiveCasinoEn}        Live Casino
	Element Should Contain                       ${leftNavigationPhoneBettingEn}      Phone Betting
	Element Should Contain                       ${leftNavigationGamesEn}             Games
	Element Should Contain                       ${leftNavigationSportsEn}            Sports
	Element Should Contain                       ${leftNavigationMobileAppsEn}        Mobile Apps
	Element Should Contain                       ${leftNavigationAboutUsEn}           About Us
	Page Should Contain Element                  ${leftNavigationQQEn}            
	Page Should Contain Element                  ${leftNavigationHome24/7En}
	Page Should Contain Element                  ${firstBanner}
	Page Should Contain Element                  ${seconfBagger} 
	Page Should Contain Element                  ${thirdBanner}
	Page Should Contain Element                  ${forthBanner}
	Page Should Contain Element                  ${fifthBanner}
	Page Should Contain Element                  ${sixthBanner}      
	Page Should Contain Element                  ${license1}
	Page Should Contain Element                  ${license2}
	Page Should Contain Element                  ${footerCopyright} 
	Page Should Contain Element                  ${footerAboutUsEn} 
	Page Should Contain Element                  ${footerTermsAndConditionEn} 
	Page Should Contain Element                  ${footerPrivacyPolicyEn} 
	Page Should Contain Element                  ${footerCustomerAggreementEn} 
	Page Should Contain Element                  ${footerFAQEn}
	Page Should Contain Element                  ${footerUpButton}