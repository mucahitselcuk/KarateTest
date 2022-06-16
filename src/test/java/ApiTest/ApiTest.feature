Feature: Spotify Api Test

  Background:

    * url 'https://api.spotify.com'
    * header Authorization = 'Bearer BQCTSys976_3RIRYTJtqZNRZefearXxZBbZswPyoQEk7E-Pq2eAtRHTgcOuJbyZ0UMErXD2fowv_DLZE7eQu7G9coOJYUarHGlliUn_oOlvCsTJMzfx6gb4O0qqA7pKe1gviTfjfEbcqBEbbLqWObmd_vucEekJGGqu4Fug035UhzJiJoFFfr_VhCuSbmlYygLC0xonm4kcspl1BoxMn5ngDHbRzZlZMjzj99gZEyJNUyWdpdhLnp50OUyJsDIymF7iWp0VDqPw3GBZcvszL26H4DA'

  @createAlbum
  Scenario: Album Add
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
  Scenario: Song Search

    And path 'v1/search/'
    And param q = 'Bohemian Rhapsody'
    And param type = 'track'
    When method Get
    Then status 200
    Then assert responseTime < 5000

@songAdd
  Scenario: Song Add
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
    And param uris = 'spotify:track:3z8h0TU7ReDPLIbEnYhWZb'
    And request requestBody
    And method Post
    Then status 201
    Then assert responseTime < 5000


