# The following query returns all the characters that died in a specific event - 'Battle of the Pelennor Fields'
SELECT lotr.Notable_Characters.Name
FROM ((lotr.Notable_Characters
	INNER JOIN lotr.character_in_event ON lotr.notable_characters.Name = lotr.character_in_event.Character )
    INNER JOIN lotr.events ON lotr.character_in_event.Event = lotr.events.Name)
WHERE lotr.Events.Name = 'Battle of the Pelennor Fields'
AND lotr.notable_characters.Age_of_Death = lotr.events.Age_Finished;