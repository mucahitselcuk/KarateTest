Feature: Add Json
  Scenario: Get posted pet
    * def petPostScenario = read('ApiTest.feature@createPet')
    * def result = call petPostScenario
    * def petId = result.response.id
    * def requestBody =
    """
    {
    }
    """
    Given path 'v1/playlists//tracks',petId
    And param uris = 'spotify:track:2k1yPYf9WGA4LiqcLVwtzn'
    And request requestBody
    And method Post

