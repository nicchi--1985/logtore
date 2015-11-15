module Api
  class TradesController < ApplicationController
    def index
      @trades = Trade.all()
      render json: @trades
    end

    def create
      binding.pry
      Trade.create!(create_params)
      @trades = Trade.all
      render json: @trades
    end

    private
    def create_params
      params.require(:trade).permit(:implimentation_date,
                                    :invest_type,
                                    :action_type,
                                    :target_code,
                                    :invest_amount,
                                    :invest_quantity,
                                    :benefit_amount
                                    )
    end
  end
end
