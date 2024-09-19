# The following query returns information about events that happened outside a specific continent - 'Middle-Earth'
SELECT lotr.events.Name, lotr.events.Age_Started AS 'Age Started', lotr.events.Age_Finished AS 'Age Finished', lotr.events.Location, lotr.major_towns_locations.Region, lotr.regions.Continent, lotr.events.Event_in_Book AS 'Book'
FROM ((lotr.events
	INNER JOIN lotr.major_towns_locations ON lotr.events.Location = lotr.major_towns_locations.Name)
    INNER JOIN lotr.regions	ON lotr.major_towns_locations.Region = lotr.regions.Name)
WHERE lotr.regions.continent <> 'Middle-Earth'
ORDER BY lotr.events.Name;