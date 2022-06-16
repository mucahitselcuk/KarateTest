Feature: Karate Test

  Background:
    * configure driver = { type: 'chromedriver', showDriverLog: true }

  Scenario: Spotify Playlist

    Given driver 'https://open.spotify.com'
    And driver.maximize()
    And click("div[class='ButtonInner-sc-14ud5tc-0 iebPZv encore-inverted-light-set']")
    And input("input[id='login-username']",'mucoreddark20@gmail.com')
    And input("input[id='login-password']",'hesap123')
    And click("div[class='ButtonInner-sc-14ud5tc-0 lbsIMA encore-bright-accent-set']")
    And click("div[class='Bwc9jlVb7HWs8JJupnBB']")
    And click("button[class='wCkmVGEQh3je1hrbsFBY']")
    * delay(1000)
    And clear("input[data-testid='playlist-edit-details-name-input']")
    * delay(1000)
    And input("input[data-testid='playlist-edit-details-name-input']",'MentorLabs Challenge')
    * delay(1000)
    And click("div[class='ButtonInner-sc-14ud5tc-0 iebPZv encore-inverted-light-set']")
    And input("input[role='searchbox']",'Daft Punk')
    When click("div[aria-rowindex='2']>div>div[aria-colindex='3']>button")
    Then click("div[data-testid='action-bar-row']")
    * delay(5000)



