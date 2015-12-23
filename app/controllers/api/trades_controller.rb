module Api
  class TradesController < ApplicationController
    SUMMARY_DISP_TERM = 12

    def index
      @trades = Trade.limit(5)
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

      @trades = Trade.limit(5)
      render json: @trades
    end

    def summary
      month_period = params["month_period"].to_i || 1
      # FIXME: 要件確定後、要修正
      num_of_periods = SUMMARY_DISP_TERM / month_period.to_i
      q_date = Date.today
      q_start = q_date.months_ago(SUMMARY_DISP_TERM).beginning_of_month
      q_end = q_date.end_of_month
      @trades = Trade.where(:implimentation_date => q_start...q_end)
      @summaries = TradeSummarizer.create_summaries(
                                            trades: @trades,
                                            month_period: month_period,
                                            num_of_periods: num_of_periods,
                                            start_date: q_date
                                            )

      #res = MonthlySummarizer.build_response(@trades)

      render json: @summaries
    end

    def product_summary
      render json: {title: "sampleRes", msg: "this is a sample res for product_summaries"}
    end

    private
    def create_params
      params.require(:trade).permit(:user_id,
                                    :implimentation_date,
                                    :action_type,
                                    :forecast,
                                    :invest_amount,
                                    :invest_quantity,
                                    :benefit_amount,
                                    :change_rate,
                                    :benefit_rate
                                    )
    end

    def find_or_create_tradable
      product_type = params[:product][:tradable_type]
      product_params = params[:product][:target_params]
      return product_type.classify.constantize.find_or_create(product_params)
    end
  end
end
