# CHART-SOURCE

## A Tool for bandleaders to upload their sheet music library, create setlists, and share them with a team.

### Built with Ruby 2.7.2 and Rails 6.1.3

## Database Design
The database for Chart-Source was designed specifically for sheet music objects, and levereges the full power of Active-Record in Rails for its model associations.  The base model is an Arrangement, which belongs to an arranger, an artist, and a song.  Arrangements also have many genres, and charts.  These arrangements belong to an owner, who can place them in a setlist, to be shared with a team, which has a leader and many members.  See the diagram below for my complete database brainstorm:

![chartsource-database](https://user-images.githubusercontent.com/72274257/122371551-3f418280-cf60-11eb-913e-b211c565a826.jpg)

This solved the problem bandleaders typically run into, where they may have multiple arrangements of a particular song, covering different versions by different artists.  This keeps the objects organized, searchable, and allows the leader to specify the exact arrangment for a group to reference quickly and easily.

## Creating SetLists
The dashboard page allows for speedy creation of setlists from the users added arrangements:

![chartsource-setlist-demo](https://user-images.githubusercontent.com/72274257/122372392-eaead280-cf60-11eb-9365-5db82bae6d11.gif)

The technologies in this section include SortableJS and Stimulus for convenient drag and drop effects.  This was achieved through Webpacker, built in to Rails to allow for JavaScript packages to integrate into the application.

