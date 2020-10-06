# Team-Three-Project-3
Find the nearest dining.osu.edu menu item.

## Background
Dining services provides for a number locations around campus with diverse offerings 
but lacks a centralized search. Finding the nearest dining service that offricers Tacos
is non trivial.

## Installation
In a terminal, enter the following commands
```
git clone https://github.com/cse3901-2020au-11163/Team-Three-Project-3.git
cd Team-Three-Project-3
```
Install dependencies
```
bundle install
```

## How to use
Team-Three-Project-3 provides two modes of use. An interactive terminal and a CLI experience.

### Interactive Terminal
A guided experience.
```
bundle exec main.rb
```

### CLI

Use the following commands to use the Team-Three-Project-3 service.
- Update the items database
```
ruby main.rb update
```
- Search the database
```
ruby main.rb search --location=<your-address> --search=<search-text>
```

## Contributing
The search service is composed of 4 phases.
 
 1. Scrape: NetNutritionClient will extract menu items and locations from https://dining.osu.edu/NetNutrition into an array of type Items[]
 2. Clean: Sanitize will remove duplicates and extraneous item descriptions not relevant to searching. (e.g. item sizes) 
 3. Save: Save cleaned list of Items to a CSV to improve searching experience.
 4. Search: Find search text matches and offer the nearest result.