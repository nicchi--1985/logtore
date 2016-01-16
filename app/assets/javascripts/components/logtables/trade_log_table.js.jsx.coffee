TradeLog = require('./trade_log')
_ = require('underscore')

class TradeLogTable extends React.Component
  convertStrType: (trade) ->
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
    @predate = ""
    tradeLogs = @props.trades.map (trade) =>
      strType = @convertStrType(trade)
      if trade.implimentation_date != null
        imp_date = trade.implimentation_date.substr(0,10)

      `<TradeLog key={trade.id}
                 trade_id={trade.id}
                 implimentation_date={trade.implimentation_date}
                 action_type={trade.action_type}
                 product_type={trade.tradable_type}
                 product={trade.tradable}
                 invest_amount={trade.invest_amount}
                 invest_quantity={trade.invest_quantity}
                 bases={trade.bases}>
      </TradeLog>`

  groupingNodesWithDate: (nodes) ->
    gNodes = {}
    for node in nodes
      if not gNodes[node.props.implimentation_date]
        gNodes[node.props.implimentation_date] = []
      gNodes[node.props.implimentation_date].push(node)
    return gNodes

  buildTradeList: =>
    nodes = @renderTradeLogs()
    gNodes = @groupingNodesWithDate(nodes)
    tradeList = []
    for date of gNodes
      tradeList.push(
        `<TradeLogTablePerDate key={date} date={date} tradelogs={gNodes[date]} />`
      )
    return tradeList

  render: ->
    `<div className='tradeList'>
      <label>最新ログ一覧</label>
      {this.buildTradeList()}
    </div>`

class TradeLogTablePerDate extends React.Component
  render: ->
    `<table>
      <thead>
        <tr><th colSpan="4">{this.props.date}</th></tr>
      </thead>
      <tbody>
        {this.props.tradelogs}
      </tbody>
    </table>`

module.exports = TradeLogTable
