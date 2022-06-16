Feature: Spotify Api Test

  Background:

    * url 'https://api.spotify.com'
    * header Authorization = 'Bearer BQC_qUFils6kB9n_BLIxRkHx7_-6gwATQ2v-wrlIyeHJZx06lTNGIM9iJOTYO6v5qcDa_Rlt-C8HtbHABmeVwP53ZQ-2DmBs-txi9rBcQk2CyJv5wDUrAnkQlZj6aKfvFNk7CYsq60tfs0d_LL0RtUdDiM33Mp2BCnfDll6pVvgfuTq-ENMTMDAE3W1vvRHNXEz_oXroZ3yhn14HtpngxlrsuwYH2mtnTp5WLjm5HPdwe2FJbxyqw3w6olZ9z1KJBVNl1DRjssMgmYpEUumfy8do_w'

  @createAlbum
  Scenario: Album Olusturma
    * def requestBody =
"""
{
  "name": "MentorLabs API",
  "description": "New playlist description",
  "public": true
}
"""
    And path 'v1/users/31ga3dv2y3cqzvtfpyvgo2yhi274/playlists'
    And request requestBody
    When method Post
    Then status 201
    And print 'after get', response
    Then assert responseTime < 5000

  @searchSong
  Scenario: Şarkı Aratma

    And path 'v1/search/'
    And param q = 'Bohemian Rhapsody'
    And param type = 'track'
    When method Get
    Then status 200
    Then assert responseTime < 5000


  Scenario: Albüme Şarkı Ekleme
    * def petPostScenario = read('ApiTest.feature@createAlbum')
    * def petPostScenario1 = read('ApiTest.feature@searchSong')
    * def result = call petPostScenario
    * def result1 = call petPostScenario1
    * def petId = result.response.id
    * def uriId = result1.response.uri
    * def requestBody =
    """
    {
    }
    """
    And path 'v1/playlists'
    And path petId
    And path '/tracks'
    And param uris = uriId
    And request requestBody
    And method Post
    Then status 201
    Then assert responseTime < 5000

  Scenario: Albüme Şarkı Add
    * def petPostScenario = read('ApiTest.feature@searchSong')
    * def result = call petPostScenario
    * def petId = result.response.id

