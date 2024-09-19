# The following query returns information about a character that has ever held an artifact, as well as when they acquired it
SELECT DISTINCT lotr.notable_characters.Name, lotr.notable_characters.Race, lotr.character_has_artifact.Artifact, lotr.character_has_artifact.Age_Acquired
FROM lotr.notable_characters 
RIGHT JOIN lotr.character_has_artifact 
ON lotr.notable_characters.Name = lotr.character_has_artifact.Character
ORDER BY lotr.character_has_artifact.Artifact;