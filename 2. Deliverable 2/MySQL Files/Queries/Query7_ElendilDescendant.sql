# The following query returns all the descendants of a character - 'Elendil' - and the house they are in
# Finds character's children and finds every other character that is in the house created by children
SELECT lotr.notable_characters.Name, lotr.notable_characters.House
FROM lotr.notable_characters
JOIN lotr.houses 
ON lotr.houses.Name = lotr.notable_characters.House
WHERE lotr.houses.Founder 
IN (SELECT lotr.notable_characters.Name 
	FROM lotr.notable_characters 
    WHERE lotr.notable_characters.Father = 'Elendil')
OR lotr.notable_characters.Father = 'Elendil';