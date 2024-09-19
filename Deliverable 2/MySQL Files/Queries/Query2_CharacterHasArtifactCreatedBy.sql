# The following query returns all the characters that ever held an artifact created by a specific character - 'Telchar' - and which artifact they held
SELECT DISTINCT lotr.Character_has_Artifact.Character, lotr.Character_has_Artifact.Artifact
FROM lotr.Character_has_Artifact 
JOIN lotr.Artifacts 
ON lotr.Character_has_Artifact.Artifact = lotr.Artifacts.Name
WHERE lotr.Artifacts.Creator = 'Telchar';