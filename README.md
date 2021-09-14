# CHART-SOURCE

## A Tool for bandleaders to upload their sheet music library, create setlists, and share them with a team.

### Built with Ruby 2.7.2 and Rails 6.1.3
* View the fully deployed application on Heroku here: https://chart-source.herokuapp.com/
* View a complete video demo of this application here:  https://youtu.be/WjS2R5mJihA 
* To install locally, clone this repo, and run `bundle install` from the local repository.
* Run `> rvm use 2.7.2` to make sure you are running the proper version of Rails.
* Run `> rails s` to launch the Rails server, and navigate to `http://localhost:3000` to view the application in your browser 

# Key Features
## Database Design
The database for Chart-Source was designed specifically for sheet music objects, and levereges the full power of Active-Record in Rails for its model associations.  The base model is an Arrangement, which belongs to an arranger, an artist, and a song.  Arrangements also have many genres, and charts.  These arrangements belong to an owner, who can place them in a setlist, to be shared with a team, which has a leader and many members.  See the diagram below for my complete database brainstorm:

![chartsource-database](https://user-images.githubusercontent.com/72274257/122371551-3f418280-cf60-11eb-913e-b211c565a826.jpg)

This solved the problem bandleaders typically run into, where they may have multiple arrangements of a particular song, covering different versions by different artists.  This keeps the objects organized, searchable, and allows the leader to specify the exact arrangment for a group to reference quickly and easily.

## Adding Arrangements
The New Arrangement page can be reached from the "Manage Arrangements" button on the dashboard, or the "Arrangements" button on the navbar.  Nested dynamic forms allow for adjusting this page to accomodate the number of charts in the arrangement.  Once entered, the PDF's are uploaded to a Cloudinary.com server.  These arrangements can then be used in the dashboard section and added to setlists.

![chartsource-add-arrangement-demo](https://user-images.githubusercontent.com/72274257/122387398-1b396d80-cf6f-11eb-9226-eef0b43c5996.gif)

## Creating SetLists
The dashboard page allows for speedy creation of setlists from the users added arrangements:

![chartsource-setlist-demo](https://user-images.githubusercontent.com/72274257/122372392-eaead280-cf60-11eb-9365-5db82bae6d11.gif)

The technologies in this section include SortableJS and Stimulus for convenient drag and drop effects.  This was achieved through Webpacker, built in to Rails to allow for JavaScript packages to integrate into the application.

## Sharing SetLists
The Team portal section makes it quick and easy to share your created setlists with your team members.  Your team can also share their own setlists or propose variants in the team page.  

![chartsource-share-setlist-demo](https://user-images.githubusercontent.com/72274257/122385599-4cb13980-cf6d-11eb-87f6-b06da1ebcf3a.gif)

## User Login
This application utilizes Omniauth to allow for login through Facebook or Github credentials.

## What's next?
Currently, the free version of Cloudinary does not allow for the preparation and download of PDF's, so the application has placeholder functionality that I hope to eventually build out to bring this application into the market for use by the general public.  
