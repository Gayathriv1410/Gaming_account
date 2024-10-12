# Gaming_account
This repository contains SQL scripts to create and manage a game-related database. The database includes entities such as accounts, characters, items, regions, and creeps. It simulates a game environment where players can create characters, collect items, and encounter different creeps in various regions.
The database consists of the following main tables:

1. **Account**: Stores user information, including their subscription details.
2. **Region**: Defines various regions where players and characters exist.
3. **Character**: Represents the player-controlled characters in the game, each associated with an account and region.
4. **Item**: Defines various items available in the game.
5. **ItemInstantiation**: Represents specific instances of items in the game, each with a unique modifier.
6. **Creep**: Defines the different non-player creatures in the game.
7. **CreepInstantiation**: Represents individual instances of creeps.
8. **CharacterCarriesItem**: Represents which items each character is carrying.
9. **CreepCarriesItem**: Represents which items each creep is carrying.
10. **RanInto**: Tracks which characters encounter specific creeps.

### Relationships

- **Account** and **Character** have a one-to-many relationship, meaning one account can have multiple characters.
- **Region** and **Character** have a one-to-many relationship, meaning a region can host multiple characters.
- **Character** and **ItemInstantiation** have a many-to-many relationship through the **CharacterCarriesItem** table.
- **CreepInstantiation** and **ItemInstantiation** also have a many-to-many relationship through the **CreepCarriesItem** table.

## SQL Queries

This repository includes SQL queries for the following operations:

1. **Creating Tables**: The script defines the structure of the database and relationships between tables.
2. **Inserting Data**: Example data is inserted for accounts, characters, items, and creeps to demonstrate the functioning of the database.
3. **Retrieving Data**: Several `SELECT` queries are provided to retrieve and explore the data.

### Example Data

- **Accounts**: Five sample accounts are created, each with unique usernames and details.
- **Regions**: Five different regions with varying climates and environments.
- **Characters**: Each account has a character associated with one of the regions.
- **Items**: Various weapons and armor are created, each with unique properties.
- **Creeps**: Different non-player characters, including imps, golems, and vampires.

### Sample Queries

You can use the following queries to view the data in the tables:

```sql
-- Query all accounts
SELECT * FROM Account;

-- Query all regions
SELECT * FROM Region;

-- Query all items
SELECT * FROM Item;

-- Query all item instantiations
SELECT * FROM ItemInstantiation;

-- Query all creeps
SELECT * FROM Creep;

-- Query all creep instantiations
SELECT * FROM CreepInstantiation;

-- Query all character-item relationships
SELECT * FROM CharacterCarriesItem;

-- Query all creep-item relationships
SELECT * FROM CreepCarriesItem;

-- Query character-creep encounters
SELECT * FROM RanInto;
