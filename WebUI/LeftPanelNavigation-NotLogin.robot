*** Settings ***
Documentation    A test suite for testing Sprint 1:  LD-360: Assets: Games landing page

Resource          PageResource.robot
Resource          Resource.robot

Suite Setup       Run Keywords		Open Page 
Suite Teardown    Close All Browsers

*** Test Cases ***

Live Casino
	Wait Until Element Is Visible                ${pageLogo}
	Click Element                                ${leftNavigationLiveCasinoEn}
	Page Should Contain Element                  ${liveCasinoPageImage} 
	Page Should Contain Element                  ${letsGoButtonEn}
	Element Should Contain                       ${pageIntro}                           Win your riches in the Holey Live Casino.
	Element Should Contain                       ${pageSubText}                       	It's easy to start winning!	
	Page Should Contain Element                  ${liveCasinoStep1Icon} 
	Page Should Contain Element                  ${liveCasinoStep2Icon} 
	Page Should Contain Element                  ${liveCasinoStep3Icon} 
	Element Should Contain                       ${liveCasinoStep1}                      Create an account in a few easy steps.                                             
    Element Should Contain                       ${liveCasinoStep2}                      Fund your account.     
    Element Should Contain                       ${liveCasinoStep3}                      Play!     

Phone Betting
    Click Element                                ${pageLogo}
    Sleep                                        5s
	Click Element                                ${leftNavigationPhoneBettingEn}
	Page Should Contain Element                  ${phoneBettingPageImage}    
	Element Should Contain                       ${pageIntro}                           We're launching another exciting game.
	Element Should Contain                       ${pageSubText}                       	Be the first to find out.
	Page Should Contain Element                  ${pageInputEmail}
	Page Should Contain Element                  ${pageSubmitButton}
    Element Should Contain                       ${pageEmailWhenReady}                  Email me when it's ready
    
Games
    Click Element                                ${pageLogo}
    Sleep                                        5s
	Click Element                                ${leftNavigationGamesEn}
	Page Should Contain Element                  ${gamesPageImage}  
	Element Should Contain                       ${pageIntro}                           Let's make it more exciting. More games coming soon.
	Element Should Contain                       ${pageSubText}                       	Be the first to find out.
	Page Should Contain Element                  ${pageInputEmail}
	Page Should Contain Element                  ${pageSubmitButton}
    Element Should Contain                       ${pageEmailWhenReady}                  Email me when it's ready
    
Sports
    Click Element                                ${pageLogo}
    Sleep                                        5s
	Click Element                                ${leftNavigationSportsEn} 
	Page Should Contain Element                  ${sportsPageImage} 
	Element Should Contain                       ${pageIntro}                           We wouldn't want you to miss out on betting on your favorite sports.
	Element Should Contain                       ${pageSubText}                       	Be the first to find out.
	Page Should Contain Element                  ${pageInputEmail}
	Page Should Contain Element                  ${pageSubmitButton}
    Element Should Contain                       ${pageEmailWhenReady}                  Email me when it's ready
    
Mobile Apps
    Click Element                                ${pageLogo}
    Sleep                                        5s   
	Click Element                                ${leftNavigationMobileAppsEn}
	Page Should Contain Element                  ${mobileAppsPageImage} 
	Element Should Contain                       ${pageIntro}                           Let's change the way you play. Mobile app coming soon.
	Element Should Contain                       ${pageSubText}                       	Be the first to find out.
	Page Should Contain Element                  ${pageInputEmail}
	Page Should Contain Element                  ${pageSubmitButton}
    Element Should Contain                       ${pageEmailWhenReady}                  Email me when it's ready
    
About Us
   Click Element                                 ${pageLogo}
   Sleep                                        5s
   Click Element                                 ${leftNavigationAboutUsEn}
   Element Should Contain                        ${aboutUsHeader}                       About Us  
   Page Should Contain Element                   ${aboutUsPageImageAvatar}
   Element Should Contain                        ${aboutUsHoleyEnt}                     Holey Entertainment
   Element Should Contain                        ${aboutUsHoleyEntPar}[1]               HOLEY ENTERTAINMENT is located in Manila, Philippines, providing live studio, API and online games to customers and business partners. Holey adopts strict training on dealers and customer services officers in order to offer the business partners and customers the best quality, services and reputation.
   Element Should Contain                        ${aboutUsHoleyEntPar}[2]               The Group has been granted the online operating license which was jointly issued by First Cagayan Leisure & Resort Corporation (FCLRC) and Cagayan Economic Zone Authority (CEZA).
   Element Should Contain                        ${aboutUsHoleyEntPar}[3]               The Group will continue to develop different games to satisfy the needs of different customers and business partners in order to prepare for future opportunities and challenges.
   Page Should Contain Element                   ${aboutUsPageImageCardsandChips}
   Element Should Contain                        ${aboutUsGamesandServices}             Games and Services
   Element Should Contain                        ${aboutUsGamesandServicesPar}[1]       HOLEY ENTERTAINMENT provides customer with a safe, reliable and reputable online popular gaming platform with great enjoyment. We also ensure that all online transactions and games are recorded with caution and highest standards. HOLEY ENTERTAINMENT online casino allows players to experience the best of wonderful online casino games throughout the year. We are providing general baccarat and squeeze baccarat, so our valued customers can enjoy the game in different ways and fun.
   Element Should Contain                        ${aboutUsGamesandServicesPar}[2]       We also specialize in live action video game development, providing web design, internet access and API support one-stop solution. The Group adopts the to issue six cards for baccarat, bet after the cards are issued which eliminating tiibility of fraud.
   Page Should Contain Element                   ${aboutUsPageImageTile-Shield} 
   Element Should Contain                        ${aboutUsPlatformandAdvantage}         Platform Advantage         
   Element Should Contain                        ${aboutUsPlatformandAdvantagePar}[1]   HOLEY ENTERTAINMENT provides inquiries supports for its customers on 24/7basis. Customers are welcome to make inquiries on their accounts or the platform when needed. Mandarin speaking customer services officers are standby to support.
   Element Should Contain                        ${aboutUsPlatformandAdvantagePar}[2]   Regarding the procedures adopted, we fully monitor the entire progress, from card inspection, card shuffling and card delivering, every procedure is recorded in order to provide full confidence to our customers.
   Element Should Contain                        ${aboutUsPlatformandAdvantagePar}[3]   All dealers have been well trained and required to pass intensive examinations before they are officially recruited as dealers. We have strict requirements on their images, manners and make up in order to ensure every dealer acquires the best professional skills and manners. 
   Element Should Contain                        ${aboutUsPlatformandAdvantagePar}[4]   Our hardware and equipment fulfill international standards, including but not limited to humidity climate control rack, uninterruptable power systems and professional fire-fighting facilities, card access conrol and 24 hours CCTV monitoring the working environment with a view to setting up the best server platform environments.
   
QQ: 800157991 
   Click Element                                  ${leftNavigationQQEn}
   Element Should Contain                         ${leftNavigationQQEn}                 QQ: 800157991

24/7: +8617182229991    	
   Click Element                                  ${leftNavigationHome24/7En}
   Element Should Contain                         ${leftNavigationHome24/7En}           24/7: +8617182229991
	                          