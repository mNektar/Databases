# The following query returns all the characters of a specific race - 'Hobbits' - that held a specific artifact - 'The One Ring' - 
# as well as when they acquired it and when they lost it
SELECT lotr.notable_characters.Name, lotr.character_has_artifact.Age_Acquired AS 'Age Acquired', lotr.character_has_artifact.Age_Lost AS 'Age Lost'
FROM lotr.notable_characters 
JOIN lotr.character_has_artifact 
ON lotr.notable_characters.Name = lotr.character_has_artifact.Character
WHERE lotr.notable_characters.Race = 'Hobbits' 
AND lotr.character_has_artifact.Artifact = 'The One Ring'
ORDER BY lotr.character_has_artifact.Age_Acquired;