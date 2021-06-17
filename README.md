# CHART-SOURCE

## A Tool for bandleaders to upload their sheet music library, create setlists, and share them with a team.

### Built with Ruby 2.7.2 and Rails 6.1.3

## Database Design
The database for Chart-Source was designed specifically for sheet music objects, and levereges the full power of Active-Record in Rails for its model associations.  The base model is an Arrangement, which belong to an arranger, an artist, a song.  Arrangements also have many genres, and charts.  These arrangements belong to an owner, who can place them in a setlist, to be shared with a team, which has a leader and many members.  See the diagram below for my complete database brainstorm:

![database](https://github.com/dirko/chart-source/blob/master/chartsource-database.png?raw=true)
