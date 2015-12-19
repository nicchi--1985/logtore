TradeLog = require('./trade_log')

class TradeLogTable extends React.Component
  convertStrType: (trade) ->
    console.log trade
    type = trade.action_type
    forecast = trade.forecast
    if type is 0 and forecast is false
      "買"
    else if type is 1 and forecast is false
      "売"
    else if type is 0 and forecast is true
      "買(予)"
    else if type is 1 and forecast is true
      "売(予)"
    else
      "?"

  renderTradeLogs: ->
    tradeLogs = @props.trades.map (trade) =>
      strType = @convertStrType(trade)
      if trade.implimentation_date != null
        imp_date = trade.implimentation_date.substr(0,10)
      `<TradeLog key={trade.id}
                 trade_id={trade.id}
                 implimentation_date={imp_date}
                 action_type={strType}
                 product_type={trade.tradable_type}
                 product={trade.tradable}
                 invest_amount={trade.invest_amount}
                 invest_quantity={trade.invest_quantity}
                 bases={trade.bases}>
      </TradeLog>`

  render: ->
    `<div className='tradeList'>
      <label>ログ一覧</label>
      <table>
        <thead>
          <tr>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
          </tr>
        </thead>
        <tbody>
          {this.renderTradeLogs()}
        </tbody>
      </table>
    </div>`

module.exports = TradeLogTable
