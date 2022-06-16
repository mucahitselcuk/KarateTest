Feature: Spotify Api Test

  Background:

    * url 'https://api.spotify.com'
    * header Authorization = 'Bearer BQDh8M0BffrYeS5r6Pk8bFMNMNl-qORzwIXbBOQz4hy2gpD7gNgWZo-AhfE99ReESPk1iy8Wbn6WXLpmc1w6egFaGmKkmzu9g_Q9TPBtH7IrVpvBcphYqQ_lOAWZQ2jCHSYa2ii7nB6w7zG6qmy0lHeqft5cXoxh98eTymInNhgrOYE3HnCaHnJpQO3oN3BF1KTjy17Da21x_yAWL93sYCQaS5N6qDbDHlB4vB5XaMAbGAaU9vH-VMBONAC9-Z1UzRWm8Iu0oU8cwBUVehXdK67Odw'

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


