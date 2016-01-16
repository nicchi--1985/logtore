TradeStore = require '../stores/TradeStore.coffee'

class TradeLogDetail extends React.Component
  constructor: (props) ->
    super
    @trade = TradeStore.getTradeById(@props.params.tradeId)
    console.log "********************"
    console.log @trade

  renderProductInfo: ->
    `<table></table>`

  renderBases: ->
    bases = @trade.bases
    `<table></table>`

  render: ->
    if @trade
      `<table>
        <tbody>
         <tr><th>取引日</th><td>{this.trade.implimentation_date.substr(0,10)}</td></tr>
         <tr><th>商品種類</th><td>{this.trade.tradable_type}</td></tr>
         <tr><th>取引種類</th><td>{this.trade.action_type}</td></tr>
         <tr><th>単価</th><td>{this.trade.invest_amount}</td></tr>
         <tr><th>数量</th><td>{this.trade.invest_quantity}</td></tr>
         <tr><th>利益</th><td>{this.trade.benefit_amount}</td></tr>
         <tr><th>騰落率</th><td>{this.trade.change_rate}</td></tr>
         <tr><th>利益率</th><td>{this.trade.benefit_rate}</td></tr>
        </tbody>
      </table>`
    else
      `<div>No trade was found for TradeId: {this.props.params.tradeId}</div>`

module.exports = TradeLogDetail
