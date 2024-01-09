# The following query returns all the characters that were born in a specific age - 'TA%'
# Timeless Halls	|	YT - Years of the Trees	|	FA - First Age	|	SA - Second Age	|	TA - Third Age	|	FoA - Fourth Age
SELECT lotr.notable_characters.Name, lotr.notable_characters.Age_of_Birth AS 'Age of Birth', lotr.notable_characters.Race 
FROM lotr.notable_characters
WHERE Age_of_Birth LIKE 'TA%';