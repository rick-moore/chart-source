module ArrangementsHelper
    def title_details_for(arrangement)
        if arrangement.artist
            arrangement.song.name + " - " + 
            arrangement.artist.name + " - " + 
            arrangement.arranger.name
        else
            arrangement.song.name + " - " + 
            arrangement.arranger.name
        end
    end
end