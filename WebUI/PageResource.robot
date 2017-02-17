*** Settings ***
Documentation    A resource file of locators (xpaths).


*** Variables ***
#***************************** landing Page Elements English*****************************
${pageLogo}                                      xpath=//div[@id="left-panel"]//span[@class="icon-set icon-logo"]
${loginButton}                                   xpath=//div[@class="right-header-panel"]/button[@class="btn btn-sm btn-tertiary btn-login"]
${joinNowButton}                                 xpath=//div[@class="right-header-panel"]/a[@class="btn btn-sm btn-primary btn-join"]
${langSelectorCN}                                xpath=//div[@class="left-header-panel"]//a[@href="?lang=cn"]
${langSelectorTW}                                xpath=//div[@class="left-header-panel"]//a[@href="?lang=tw"]
${langSelectorEN}                                xpath=//div[@class="left-header-panel"]//a[@href="?lang=en"]
${homePageImage}                                 xpath=//div[@id="main-container"]/img[@src="http://res.cloudinary.com/dmc99wxeq/image/upload/v1476940312/qzitjf7syjcl7soxlmhc.jpg"]
${leftNavigationHomeEn}                          xpath=//div[@class="navigation-row"]//a[@class="link" and @href="/?lang=en"]
${leftNavigationLiveCasinoEn}                    xpath=//div[@class="navigation-row"]//a[@class="link" and @href="/live-casino?lang=en"]        
${leftNavigationPhoneBettingEn}                  xpath=//div[@class="navigation-row"]//a[@class="link" and @href="phone-betting?lang=en"]             
${leftNavigationGamesEn}                         xpath=//div[@class="navigation-row"]//a[@class="link" and @href="games?lang=en"]      
${leftNavigationSportsEn}                        xpath=//div[@class="navigation-row"]//a[@class="link" and @href="sports?lang=en"]       
${leftNavigationMobileAppsEn}                    xpath=//div[@class="navigation-row"]//a[@class="link" and @href="mobile-apps?lang=en"]        
${leftNavigationAboutUsEn}                       xpath=//div[@class="navigation-row"]//a[@class="link" and @href="about-us?lang=en"]     
${leftNavigationQQEn}                            xpath=//div[@class="navigation-row"]//span[@class="icon-set icon-qq in-active"]/following-sibling::span[@class="navigation-label"]
${leftNavigationHome24/7En}                      xpath=//div[@class="navigation-row"]//span[@class="icon-set icon-support in-active"]/following-sibling::span[@class="navigation-label"]
${firstBanner}                                   xpath=//div[@class="banner-grid-cell"]/img[@src="../../images/card-welcome.png"]
${seconfBagger}                                  xpath=//div[@class="banner-grid-cell"]/img[@src="../../images/card-holey.png"]
${thirdBanner}                                   xpath=//div[@class="banner-grid-cell"]/img[@src="../../images/card-ld-loggedout.png"]
${forthBanner}                                   xpath=//div[@class="banner-grid-row"]//img[@src="../../images/card-sports.png"]
${fifthBanner}                                   xpath=//div[@class="banner-grid-row"]//img[@src="../../images/card-mobile.png"]
${sixthBanner}                                   xpath=//div[@class="banner-grid-row"]//img[@src="../../images/card-phonebetting.png"]
${license1}                                      xpath=//div[@id="license"]//span[@class="icon-set icon-license1 license-item"]
${license2}                                      xpath=//div[@id="license"]//span[@class="icon-set icon-license3 license-item"]                            
${footerCopyright}                               xpath=//div[@id="copyright"]
${footerAboutUsEn}                               xpath=//a[@class="link" and @href="/about-us?lang=en" and contains(text(),"About Us")]   
${footerTermsAndConditionEn}                     xpath=//a[@class="link" and @href="/terms?lang=en"]
${footerPrivacyPolicyEn}                         xpath=//a[@class="link" and @href="/privacy?lang=en"]
${footerCustomerAggreementEn}                    xpath=//a[@class="link" and @href="/agreement?lang=en"]
${footerFAQEn}                                   xpath=//a[@class="link" and @href="/faq?lang=en"]
${footerUpButton}                                xpath=//a[@id="scrollToTop"]/span[@class="icon-set icon-circle-up"]


#*****************************Common on all page Elements *****************************
${pageIntro}                                xpath=//div[@id="introForm"]//h3
${pageSubText}                              xpath=//div[@id="introForm"]//p[@class="sub-page-sub-text"]
${pageSubParagraph}                         xpath=//div[@id="introForm"]//p
${pageInputEmail}                           xpath=//input[@name="emailAddress" and @data-restrict="email"]
${pageSubmitButton}                         xpath=//button[@id="subscribeBtn" and contains(text(),"SUBMIT")]
${pageEmailWhenReady}                       xpath=//div[@id="introForm"]//div[2]/div

#***************************** Live Casino Page Elements *****************************
${liveCasinoPageImage}                           xpath=//img[@src="../../images/slice-ldloggedout-image.png"]
${letsGoButtonEn}                                xpath=//a[@id="letsgoBtn" and @href="register?lang=en"]
${liveCasinoStep1Icon}                           xpath=//span[@class="icon-form-set-6 icon-pen-paper"]
${liveCasinoStep1}                               xpath=//span[@class="icon-form-set-6 icon-pen-paper"]/following-sibling::div[@class="info"]
${liveCasinoStep2Icon}                           xpath=//span[@class="icon-form-set-6 icon-money"]
${liveCasinoStep2}                               xpath=//span[@class="icon-form-set-6 icon-money"]/following-sibling::div[@class="info"]
${liveCasinoStep3Icon}                           xpath=//span[@class="icon-form-set-6 icon-card-single"]
${liveCasinoStep3}                               xpath=//span[@class="icon-form-set-6 icon-card-single"]/following-sibling::div[@class="info"]

#***************************** Phone Betting Page Elements *****************************
${phoneBettingPageImage}                         xpath=//img[@src="../../images/slice-phonebetting-image.png" and @class="img-responsive"]

#***************************** Games Page Elements *****************************
${gamesPageImage}                                xpath=//img[@src="../../images/slice-games-images.png" and @class="img-responsive"]
${gamesEmailErrorValidation}                     xpath=//div[@id="emailadd-error"]/span

#***************************** Sports Page Elements *****************************
${sportsPageImage}                                xpath=//img[@src="../../images/slice-sports-images.png" and @class="img-responsive"]

#***************************** Mobile Apps Page Elements *****************************
${mobileAppsPageImage}                                xpath=//img[@src="../../images/slice-mobile-images.png" and @class="img-responsive center-m"]

#***************************** About Us Page Elements *****************************
${aboutUsHeader}                                   xpath=//div[@class="content-wrapper about-us"]//h3[@class="header"]
${aboutUsPageImageAvatar}                          xpath=//img[@src="../../images/tile-avatar.png" and @class="img-responsive center-m"]
${aboutUsHoleyEnt}                                 xpath=//div[@class="col-xs-12 col-sm-9 col-md-9"]/h3
${aboutUsHoleyEntPar}                              xpath=//div[@class="col-xs-12 col-sm-9 col-md-9"]/p
${aboutUsPageImageCardsandChips}                   xpath=//div[@class="col-xs-12 col-sm-3 switch-d"]/img[@src="../../images/tile-chips-cards.png"]
${aboutUsGamesandServices}                         xpath=//div[@class="col-xs-12 col-sm-3 switch-d"]/preceding-sibling::div[@class="col-xs-12 col-sm-9"]/h3
${aboutUsGamesandServicesPar}                      xpath=//div[@class="col-xs-12 col-sm-3 switch-d"]/preceding-sibling::div[@class="col-xs-12 col-sm-9"]/p
${aboutUsPageImageTile-Shield}                     xpath=//div[@class="row row-group row-group-last"]//img[@src="../../images/tile-shield.png" and @class="img-responsive center-m"]
${aboutUsPlatformandAdvantage}                     xpath=//div[@class="row row-group row-group-last"]//div[@class="col-xs-12 col-sm-9"]/h3
${aboutUsPlatformandAdvantagePar}                  xpath=//div[@class="row row-group row-group-last"]//div[@class="col-xs-12 col-sm-9"]/p
