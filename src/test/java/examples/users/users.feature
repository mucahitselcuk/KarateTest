
Feature: Karate Test

  Background:
    * configure driver = { type: 'chromedriver', showDriverLog: true }
  # * configure driverTarget = { docker: 'justinribeiro/chrome-headless', showDriverLog: true }
  # * configure driverTarget = { docker: 'ptrthomas/karate-chrome', showDriverLog: true }
  # * configure driver = { type: 'chromedriver', showDriverLog: true }
  # * configure driver = { type: 'geckodriver', showDriverLog: true }
  # * configure driver = { type: 'safaridriver', showDriverLog: true }

  Scenario: Spotify Playlist

    Given driver 'https://open.spotify.com'
    And driver.maximize()
    And click("div[class='ButtonInner-sc-14ud5tc-0 iebPZv encore-inverted-light-set']")
    And input("input[id='login-username']",'mucoreddark20@gmail.com')
    And input("input[id='login-password']",'hesap123')
    And click("div[class='ButtonInner-sc-14ud5tc-0 lbsIMA encore-bright-accent-set']")
    And click("div[class='Bwc9jlVb7HWs8JJupnBB']")
    And click("button[class='wCkmVGEQh3je1hrbsFBY']")
    And input("input[data-testid='playlist-edit-details-name-input']",'MentorLabs Challenge')
    And click("div[class='ButtonInner-sc-14ud5tc-0 iebPZv encore-inverted-light-set']")
    And input("input[role='searchbox']",'Daft Punk')
    And waitFor("div[aria-rowindex='1']>div>div[aria-colindex='3']>button")
    And click("div[aria-rowindex='1']>div>div[aria-colindex='3']>button")



