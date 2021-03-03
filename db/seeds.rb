# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

##### USERS #####
user1 = User.create(username: "Rick", email: "rick@email.com", password: "rick", instrument: "Sax")
user2 = User.create(username: "Connor", email: "connor@email.com", password: "connor", instrument: "Drums")
user3 = User.create(username: "Emmet", email: "emmet@email.com", password: "emmet", instrument: "Guitar")
user4 = User.create(username: "Julian", email: "julian@email.com", password: "julian", instrument: "Bass")
user5 = User.create(username: "Stephan", email: "stephan@email.com", password: "stephan", instrument: "Keyboard")
user6 = User.create(username: "Ish", email: "ish@email.com", password: "ish", instrument: "Trombone")
user7 = User.create(username: "Alejo", email: "alejo@email.com", password: "alejo", instrument: "Trumpet")
user8 = User.create(username: "Nicole", email: "nicole@email.com", password: "nicole", instrument: "Vocals")

##### TEAMS #####
team1 = user1.led_teams.create(name: "Glory Band")

Membership.create(team_id: 1, user_id: 2)
Membership.create(team_id: 1, user_id: 3)
Membership.create(team_id: 1, user_id: 4)
Membership.create(team_id: 1, user_id: 5)
Membership.create(team_id: 1, user_id: 6)
Membership.create(team_id: 1, user_id: 7)
Membership.create(team_id: 1, user_id: 8)

##### ARTISTS #####
artist1 = Artist.create(name: "Michael Jackson", owner: user1)
artist2 = Artist.create(name: "Tom Petty", owner: user1)
artist3 = Artist.create(name: "Beyonce", owner: user1)
artist4 = Artist.create(name: "Phil Collins", owner: user1)
artist5 = Artist.create(name: "Bruno Mars", owner: user1)

##### ARRANGERS #####
arranger1 = Arranger.create(name: "Shawn Evans", owner: user1)
arranger2 = Arranger.create(name: "Peter Halloin", owner: user1)
arranger3 = Arranger.create(name: "Sammy Nestico", owner: user1)
arranger4 = Arranger.create(name: "Sammy Rothberg", owner: user1)
arranger5 = Arranger.create(name: "Carnival", owner: user1)

##### SONGS #####
song1 = artist1.songs.create(name: "Beat It", owner: user1)
song2 = artist2.songs.create(name: "Mary Janes Last Dance", owner: user1)
song3 = artist3.songs.create(name: "Crazy in Love", owner: user1)
song4 = artist4.songs.create(name: "In The Air Tonight", owner: user1)
song5 = artist5.songs.create(name: "24K Magic", owner: user1)

##### ARRANGEMENTS #####
arrangement1 = user1.owned_arrangements.create(arranger: arranger1, song: song1, key: "Em", tempo: 118)
arrangement2 = user1.owned_arrangements.create(arranger: arranger2, song: song1, key: "Gm", tempo: 120)
arrangement3 = user1.owned_arrangements.create(arranger: arranger5, song: song2, key: "E", tempo: 105)
arrangement4 = user1.owned_arrangements.create(arranger: arranger4, song: song2, key: "F#", tempo: 98)
arrangement5 = user1.owned_arrangements.create(arranger: arranger3, song: song3, key: "C#", tempo: 97)
arrangement6 = user1.owned_arrangements.create(arranger: arranger4, song: song4, key: "Bb", tempo: 111)
arrangement7 = user1.owned_arrangements.create(arranger: arranger5, song: song5, key: "Ebm", tempo: 134)

##### GENRES #####
genre1 = Genre.create(name: "pop", owner: user1)
genre2 = Genre.create(name: "blues", owner: user1)
genre3 = Genre.create(name: "rock", owner: user1)
genre4 = Genre.create(name: "jazz", owner: user1)
genre5 = Genre.create(name: "R&B", owner: user1)

arrangement1.genres << genre1
arrangement1.genres << genre3
arrangement2.genres << genre2
arrangement3.genres << genre3
arrangement3.genres << genre5
arrangement4.genres << genre5
arrangement5.genres << genre1
arrangement6.genres << genre2
arrangement7.genres << genre3

##### CHARTS #####
arrangement1.charts.create(instrument: "Trumpet")
arrangement1.charts.create(instrument: "Sax")
arrangement1.charts.create(instrument: "Trombone")
arrangement1.charts.create(instrument: "Drums")
arrangement1.charts.create(instrument: "Bass")
arrangement1.charts.create(instrument: "Guitar")
arrangement1.charts.create(instrument: "Keyboard")
arrangement1.charts.create(instrument: "Vocals")

arrangement2.charts.create(instrument: "Trumpet")
arrangement2.charts.create(instrument: "Sax")
arrangement2.charts.create(instrument: "Trombone")
arrangement2.charts.create(instrument: "Drums")
arrangement2.charts.create(instrument: "Bass")
arrangement2.charts.create(instrument: "Guitar")
arrangement2.charts.create(instrument: "Keyboard")
arrangement2.charts.create(instrument: "Vocals")

arrangement3.charts.create(instrument: "Trumpet")
arrangement3.charts.create(instrument: "Sax")
arrangement3.charts.create(instrument: "Trombone")
arrangement3.charts.create(instrument: "Drums")
arrangement3.charts.create(instrument: "Bass")
arrangement3.charts.create(instrument: "Guitar")
arrangement3.charts.create(instrument: "Keyboard")
arrangement3.charts.create(instrument: "Vocals")

arrangement4.charts.create(instrument: "Drums")
arrangement4.charts.create(instrument: "Bass")
arrangement4.charts.create(instrument: "Guitar")
arrangement4.charts.create(instrument: "Keyboard")
arrangement4.charts.create(instrument: "Vocals")

arrangement5.charts.create(instrument: "Drums")
arrangement5.charts.create(instrument: "Bass")
arrangement5.charts.create(instrument: "Guitar")
arrangement5.charts.create(instrument: "Keyboard")
arrangement5.charts.create(instrument: "Vocals")

arrangement6.charts.create(instrument: "Drums")
arrangement6.charts.create(instrument: "Bass")
arrangement6.charts.create(instrument: "Guitar")
arrangement6.charts.create(instrument: "Keyboard")
arrangement6.charts.create(instrument: "Vocals")

arrangement7.charts.create(instrument: "Drums")
arrangement7.charts.create(instrument: "Bass")
arrangement7.charts.create(instrument: "Guitar")
arrangement7.charts.create(instrument: "Keyboard")
arrangement7.charts.create(instrument: "Vocals")

##### SETLISTS #####
setlist1 = team1.setlists.create(name: "Fun Music Night 1", creator: user1)


setlist1.set_entries.create(arrangement: arrangement1)
setlist1.set_entries.create(arrangement: arrangement4)
setlist1.set_entries.create(arrangement: arrangement5)
setlist1.set_entries.create(arrangement: arrangement7)

setlist2 = team1.setlists.create(name: "Fun Music Night 2", creator: user1)

setlist2.set_entries.create(arrangement: arrangement2)
setlist2.set_entries.create(arrangement: arrangement3)
setlist2.set_entries.create(arrangement: arrangement6)
setlist2.set_entries.create(arrangement: arrangement7)