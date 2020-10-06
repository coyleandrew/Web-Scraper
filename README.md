# Team-Three-Project-3
Find the nearest [Dining](https://dining.osu.edu/NetNutrition) menu item.

## Background
Dining services offers for a number locations around campus with diverse offerings 
but lacks a centralized search. For example, finding the nearest dining service that offers Tacos
is non trivial.

## Installation
In a terminal, enter the following commands

Download the searvice.
```
git clone https://github.com/cse3901-2020au-11163/Team-Three-Project-3.git
cd Team-Three-Project-3
```
Install dependencies.
```
bundle install
```

## How to use
Team-Three-Project-3 provides two modes of use. An interactive terminal and a CLI experience.

### Interactive Terminal
A guided experience.
```
ruby main.rb
```
### CLI

Use the following commands to use the Team-Three-Project-3 service.

- Update the item's database.
```
ruby main.rb update
```
- Search the database
```
ruby main.rb search 'your-address' 'search-text'
```

### Address
A quick note about location. Your address is required to determine your location for the purpose of calculating distances. Many address strings
are acceptable, the easiest being a simple 5 digit zip code.


## Contributing
The search service is composed of 3 phases.
 
 1. Scrape: NetNutritionClient will extract menu items and locations from https://dining.osu.edu/NetNutrition into an array of type Items[]
 3. Save: Save list of items to a CSV to improve searching experience.
 4. Search: Find search text matches and offer the nearest result.