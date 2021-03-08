class ChartsController < ApplicationController
    before_action :set_chart, only: %i[ show edit update]
    def show
    end

    def edit
    end

    def update
        @chart.update(chart_params)
        if @chart.save
            redirect_to @chart
        end
    end

    private 
        def set_chart
            @chart = Chart.find(params[:id])
        end

        def chart_params
            params.require(:chart).permit(:instrument, :chart_pdf)
        end
end