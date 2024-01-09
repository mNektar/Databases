# The following query returns all the characters that speak ALL the languages that a specific character speaks,
# excluding that character - 'Frodo Baggins'
SELECT lotr.characters_languages.Character
FROM lotr.characters_languages
WHERE lotr.characters_languages.language IN (
    SELECT lotr.characters_languages.language
    FROM lotr.characters_languages 
    WHERE lotr.characters_languages.Character = 'Frodo Baggins')
GROUP BY lotr.characters_languages.Character
HAVING COUNT(DISTINCT lotr.characters_languages.language) = (
    SELECT COUNT(DISTINCT lotr.characters_languages.language)
    FROM lotr.characters_languages
    WHERE lotr.characters_languages.Character = 'Frodo Baggins')
AND NOT (lotr.characters_languages.Character = 'Frodo Baggins');