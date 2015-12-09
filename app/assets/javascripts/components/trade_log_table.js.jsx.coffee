TradeLog = require('./trade_log')

class TradeLogTable extends React.Component
  convertStrType: (intType) ->
    switch intType
      when 0
        "buy"
      when 1
        "sell"
      else
        "-"

  render: ->
    tradeLogs = @props.trades.map (trade) =>
      strType = @convertStrType(trade.action_type)
      if trade.implimentation_date != null
        imp_date = trade.implimentation_date.substr(0,10)
      console.log trade
      `<TradeLog trade_id={trade.id}
                 implimentation_date={imp_date}
                 action_type={strType}
                 product_type={trade.tradable_type}
                 invest_amount={trade.invest_amount}
                 invest_quantity={trade.invest_quantity}>
      </TradeLog>`

    `<table className='TradeList'>
      <thead>
        <tr>
          <th>取引ID</th>
          <th>取引日</th>
          <th>取引タイプ</th>
          <th>商品種類</th>
          <th>単価</th>
          <th>数量</th>
        </tr>
      </thead>
      <tbody>
        {tradeLogs}
      </tbody>
    </table>`

module.exports = TradeLogTable
