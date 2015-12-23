class TradeSummarizer
  # month_period: サマリの単位。月数を指定
  # num_of_periods: サマリ集計数を指定
  # start_date: 集計の起点を指定
  def self.create_summaries(trades:, month_period:, num_of_periods:5, start_date:Date.today)
    periods = create_period_list(month_period, num_of_periods, start_date)
    trade_lists = devide_in_periods(trades, periods)
    summaries = []
    trade_lists.each_with_index do |trade_list, i|
      summary = summarize(periods[i], trade_list)
      summaries.push(summary)
    end
    return summaries
  end

  private
  def self.devide_in_periods(trades, periods)
    trade_lists = []
    # todo: impliment!
    # 対象のpriodにtradeが一つもない場合は空arrayをつっこむ
    # ActiveSupport: at_beginning_of_month, end_of_month, months_ago(x)
    # trade_lists: [[trade1,trade2,trade3],[trade4,trade5],[trade6]]
    periods.each do |p|
      list = trades.find_all {|t| t.implimentation_date.between?(p.at_beginning_of_month, p.end_of_month)}
      trade_lists.push(list)
    end
    return trade_lists
  end

  def self.create_period_list(month_period, num_of_periods, start_date)
    list = []
    num_of_periods.times do |i|
      period = start_date.months_ago(i)
      list.push(period)
    end
    return list
  end

  def self.summarize(period, trade_list)
    plus_benefit = 0.0
    minus_benefit = 0.0
    trade_list.each do |trade|
      rate = trade.benefit_rate || 0
      if rate >= 0
        plus_benefit += rate
      elsif rate < 0
        minus_benefit += rate
      end
    end
    summary = TradeSummary.new(period, plus_benefit, minus_benefit)
    return summary
  end
end
