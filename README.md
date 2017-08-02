# Pocket Plants
* Victoria Vasys
* https://www.pocket-plants.herokuapp.com

* (About)[#about]
    * (Tech Stack)[#tech-stack]
* (Schema)[#schema]
* (Setup)[#setup]
    * (Testing)[#testing]
* (API Endpoints)[#api-endpoints]
    * (Flower Photos)[#flower-photos]
    * (Plant Families)[#plant-families]
    * (Google Vision Descriptions)[#google-vision-descriptions]
    * (Comments)[#comments]
    * (Favorites)[#favorites]
* (Links)[#links]

## About
Ever been on a plant walk, a forest hike, or even just a little jaunt through your neighborhood and thought, wow, that's a gorgeous flower! I wish I could have that in my front yard! Or, that looks super weird! I wonder what it is. Or, I think I've seen that before, I wonder if it's invasive. Never fear, pocket plants here!

## Schema
![Pocket plants object relational map image](/../orm-schema/lib/orm_schema/images/orm_mvp.png?raw=true "Pocket plants object Relational Map Image")

### Tech Stack
* Ruby Version 2.2.5
* Rails Version 5.0.3
* react-rails Version 2.2.1
* RSpec
* APIs implemented:
    * Google Vision https://vision.googleapis.com/v1/
    * Global Biodiversity Information Facility http://api.gbif.org/v1/species/
    * Wikipedia https://en.wikipedia.org/w/api.php
    
## Setup
1. Clone down repository: `git clone git@github.com:VictoriaVasys/pocket-plants.git`
2. From project directory, run the following from the Command Line Interface (CLI) in sequential order:
    1. Install dependencies: 
    ```
    bundle install
    ```
    2. Create, migrate & seed the database: 
    ```
    bin/rails db:migrate db:create db:seed
    ```
    3. Run the server
    ```
    rails server
    ```
    4. Navigate to http://localhost:3000

### Testing

Tests run via RSpec & Selenium Webdriver

1. Ensure Firefox version 46 is installed (Selenium does not work with all versions of Firefox):
[download here](https://www.softexia.com/windows/web-browsers/firefox-46). 

  If you already have Firefox and it's on a version more recent than 46, the easiest way to downgrade is to uninstall Firefox then turn off wifi & install version 46.

2. Run testing suite from the CLI: 
```
`rspec`
``` 
(In order to run a singular test, run `rspec spec/<file path>`)

## API Endpoints
* All endpoints are RESTful and all responses are in JSON format. Some important things to note:
* All API endpoints begin with `https://www.pocket-plants.herokuapp.com/api/v1/`
* Requests are case sensitive
* Params for POST and PUT requests should be passed as x-www-form-urlencoded

### Flower Photos
| --- | --- |:---:| --- |
|GET|flower_photos|retrieves all flower photos|N/A|
|GET|users/flower_photos/:id|retrieves a flower_photo|N/A|
|GET|users/flower_photos/find|retrieves flower photos by family name|?common_name=<string>` or `?taxonomic_name=<string>`|
|POST|users/flower_photos|adds a flower photo to the database|N/A|
|DELETE|users/flower_photos/:id|deletes a flower photo|N/A|

### Plant Families
|**HTTP Verb/Method**|**URI Path**|**Description**|**Parameters**|
| --- | --- |:---:| --- |
|GET|plant_families|retrieves all plant familites|N/A|
|GET|plant_families/:id|retrieves a single plant family|N/A|
|GET|plant_families/find|retrieves a plant family by name|?common_name=<string>` or `?taxonomic_name=<string>`|

### Google Vision Descriptions
| --- | --- |:---:| --- |
|GET|users/flower_photos/:flower_photo_id/gvision_descriptions|retrieves all google vision descriptions for a flower photo|N/A|
|POST|users/flower_photos/:flower_photo_id/gvision_descriptions|creates a flower photo google vision description|N/A|
|DELETE|users/flower_photos/:flower_photo_id/gvision_descriptions/:id|deletes a flower photo google vision description|N/A|

### Comments
| --- | --- |:---:| --- |
|GET|users/flower_photos/:flower_photo_id/comments|retrieves all comments for a flower photo|N/A|
|GET|users/flower_photos/:flower_photo_id/comments/:id|retrieves a comments for a flower photo|N/A|
|POST|users/flower_photos/:flower_photo_id/comments|creates a flower photo comment|N/A|
|PATCH|users/flower_photos/:flower_photo_id/comments/:id|updates a flower photo comment body|`?body=<string>`|
|DELETE|users/flower_photos/:flower_photo_id/comments/:id|deletes a flower photo comment|N/A|


### Favorites
| --- | --- |:---:| --- |
|GET|users/:user_id/favorite_flower_photos|retrieves a user's favorite flower photos|N/A|
|GET|users/flower_photos/:flower_photo_id/favorites|retrieves favorites for a flower photo|N/A|
|POST|users/flower_photos/:flower_photo_id/favorites|creates a favorite for a flower photo|N/A|
|DELETE|users/flower_photos/:flower_photo_id/favorites/:id|deletes a favorite for a flower photo|N/A|
|POST|users/flower_photos/:flower_photo_id/comments/:comment_id/favorites|creates a favorite for a flower photo comment|N/A|
|DELETE|users/flower_photos/:flower_photo_id/comments/:comment_id/favorites/:id|deletes a favorite for a flower photo comment|N/A|
|POST|users/flower_photos/:flower_photo_id/gvision_descriptions/:gvision_description_id/favorites|creates a favorite for a flower photo comment|N/A|
|DELETE|users/flower_photos/:flower_photo_id/gvision_descriptions/:gvision_description_id/favorites/:id|deletes a favorite for a flower photo comment|N/A|

## Links
* [Pocket Plants Production](https://www.pocket-plants.herokuapp.com)
* [Project Management Board](https://waffle.io/VictoriaVasys/pocket-plants)
* [Issue Reporting](https://github.com/VictoriaVasys/pocket-plants/issues)
* [Turing Project Overview & Expectations](http://backend.turing.io/module4/capstone_project_overview)

