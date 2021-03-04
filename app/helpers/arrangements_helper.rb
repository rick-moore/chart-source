module ArrangementsHelper
    def title_details_for(arrangement)
        arrangement.song.name + " - " + 
        arrangement.song.artist.name + " - " + 
        arrangement.arranger.name
    end
end