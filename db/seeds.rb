# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

##### USERS #####
user1 = User.create(username: "Rick", email: "rick@email.com", password: "rick123", instrument: "Sax")
user2 = User.create(username: "Connor", email: "connor@email.com", password: "connor123", instrument: "Drums")
user3 = User.create(username: "Emmet", email: "emmet@email.com", password: "emmet123", instrument: "Guitar")
user4 = User.create(username: "Julian", email: "julian@email.com", password: "julian123", instrument: "Bass")
user5 = User.create(username: "Stefan", email: "stefan@email.com", password: "stefan123", instrument: "Keyboard")
user6 = User.create(username: "Ish", email: "ish@email.com", password: "ish123", instrument: "Trombone")
user7 = User.create(username: "Alejo", email: "alejo@email.com", password: "alejo123", instrument: "Trumpet")
user8 = User.create(username: "Nicole", email: "nicole@email.com", password: "nicole123", instrument: "Vocals")

##### TEAMS #####
team1 = Team.create(name: "Glory Band", leader: user1)

Membership.create(team_id: 1, user_id: 2, display_name: "Connor A.")
Membership.create(team_id: 1, user_id: 3, display_name: "Emmet M.")
Membership.create(team_id: 1, user_id: 4, display_name: "Julian B.")
Membership.create(team_id: 1, user_id: 5, display_name: "Stefan N.")
Membership.create(team_id: 1, user_id: 6, display_name: "Ismael C.")
Membership.create(team_id: 1, user_id: 7, display_name: "Alejandro C.")
Membership.create(team_id: 1, user_id: 8, display_name: "Nicole T.")

##### ARTISTS #####
artist1 = user1.artists.create(name: "Michael Jackson")
artist2 = user1.artists.create(name: "Tom Petty")
artist3 = user1.artists.create(name: "Beyonce")
artist4 = user1.artists.create(name: "Phil Collins")
artist5 = user1.artists.create(name: "Bruno Mars")

##### ARRANGERS #####
arranger1 = user1.arrangers.create(name: "Shawn Evans")
arranger2 = user1.arrangers.create(name: "Peter Halloin")
arranger3 = user1.arrangers.create(name: "Sammy Nestico")
arranger4 = user1.arrangers.create(name: "Sammy Rothberg")
arranger5 = user1.arrangers.create(name: "Carnival")

##### SONGS #####
song1 = user1.songs.create(name: "Beat It")
song2 = user1.songs.create(name: "Mary Janes Last Dance")
song3 = user1.songs.create(name: "Crazy in Love")
song4 = user1.songs.create(name: "In The Air Tonight")
song5 = user1.songs.create(name: "24K Magic")

##### ARRANGEMENTS #####
arrangement1 = user1.owned_arrangements.create(arranger: arranger1, song: song1, artist: artist1, key: "Em", tempo: 118)
arrangement2 = user1.owned_arrangements.create(arranger: arranger2, song: song1, artist: artist1, key: "Gm", tempo: 120)
arrangement3 = user1.owned_arrangements.create(arranger: arranger5, song: song2, artist: artist2, key: "E", tempo: 105)
arrangement4 = user1.owned_arrangements.create(arranger: arranger4, song: song2, artist: artist2, key: "F#", tempo: 98)
arrangement5 = user1.owned_arrangements.create(arranger: arranger3, song: song3, artist: artist3, key: "C#", tempo: 97)
arrangement6 = user1.owned_arrangements.create(arranger: arranger4, song: song4, artist: artist4, key: "Bb", tempo: 111)
arrangement7 = user1.owned_arrangements.create(arranger: arranger5, song: song5, artist: artist5, key: "Ebm", tempo: 134)

##### GENRES #####
# genre1 = user1.genres.create(name: "pop")
# genre2 = user1.genres.create(name: "blues")
# genre3 = user1.genres.create(name: "rock")
# genre4 = user1.genres.create(name: "jazz")
# genre5 = user1.genres.create(name: "R&B")

# arrangement1.genres << genre1
# arrangement1.genres << genre3
# arrangement2.genres << genre2
# arrangement3.genres << genre3
# arrangement3.genres << genre5
# arrangement4.genres << genre5
# arrangement5.genres << genre1
# arrangement6.genres << genre2
# arrangement7.genres << genre3


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