module ArrangementsHelper
    def title_details_for(arrangement)
        arrangement.song.name + " - " + 
        arrangement.artist.name + " - " + 
        arrangement.arranger.name
    end
end