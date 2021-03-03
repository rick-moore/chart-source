class SetEntriesController < ApplicationController
    before_action :set_variables, only: :create
    after_action :js_action, only: %i[ create destroy ]
    
    def create
        @set_entry = @setlist.set_entries.create(arrangement: @arrangement)
        if params[:last_arrangement_id].to_i != 0
            @position = SetEntry.find(params[:last_arrangement_id]).position.to_i 
        else 
            @position = 0
        end
        @set_entry.insert_at(@position + 1)
    end

    def destroy
        @set_entry_id = params[:set_entry_id].to_i
        SetEntry.find(@set_entry_id).destroy
    end

    def move
        @set_entry = SetEntry.find(params[:id])
        @set_entry.insert_at(params[:position].to_i)
    end


    private
        def set_variables
            @setlist = Setlist.find(params[:setlist_id])
            @arrangement = Arrangement.find(params[:arrangement_id])
            @user = current_user
        end
        
        def js_action
            respond_to do |format|
                format.js
            end
        end
end