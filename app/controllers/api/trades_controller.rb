module Api
  class TradesController < ApplicationController
    def index
      @trades = Trade.all
      #@jtrades = @trades.to_json(:include => [:tradable, :bases])
      render json: @trades
    end

    def create
      # Productを探してIDを返す。なければ作成する
      trade = create_params
      product = params[:target_params]
      @bases = params[:bases].values()

      Trade.transaction do
        @tradable = find_or_create_tradable
        @trade = @tradable.trades.create!(create_params)
        @bases.each do |basis|
          @trade.bases << Basis.new(basis)
        end
      end

      @trades = Trade.includes(:tradable, :bases).all()
      @jtrades = @trades.to_json(:include => [:tradable, :bases])
      render json: @jtrades
    end

    private
    def create_params
      params.require(:trade).permit(:user_id,
                                    :implimentation_date,
                                    :action_type,
                                    :invest_amount,
                                    :invest_quantity,
                                    :benefit_amount
                                    )
    end

    def find_or_create_tradable
      product_type = params[:product][:tradable_type]
      product_params = params[:product][:target_params]
      return product_type.classify.constantize.find_or_create(product_params)
    end
  end
end
