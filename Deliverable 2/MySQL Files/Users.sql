DROP USER IF EXISTS 'guestuser'@'$';
DROP USER IF EXISTS 'authenticateduser'@'$';
DROP USER IF EXISTS 'employee'@'localhost';
# Create user guestuser that can perform select queries in the DB
CREATE USER 'guestuser'@'$' IDENTIFIED BY 'mypassword';
GRANT SELECT ON lotr.* TO 'guestuser'@'$';

# Create user authenticateduser that can perform select and insert queries in the DB
CREATE USER 'authenticateduser'@'$' IDENTIFIED BY 'myauthpassword';
GRANT SELECT, INSERT, UPDATE ON lotr.* TO 'authenticateduser'@'$';

# Create user employee that can perform select, insert, update and delete but only from the server of the DB (localhost)
CREATE USER 'employee'@'localhost' IDENTIFIED BY 'myemppassword';
GRANT SELECT, INSERT, UPDATE, DELETE ON lotr.* TO 'employee'@'localhost';