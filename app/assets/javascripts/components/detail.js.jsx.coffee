TradeStore = require '../stores/TradeStore.coffee'

class TradeLogDetail extends React.Component
  constructor: (props) ->
    super
    @trade = TradeStore.getTradeById(@props.params.tradeId)

  renderProductInfo: ->
    `<table></table>`

  renderBases: ->
    bases = @trade.bases.map (basis) =>
      `<tr key={basis.id}>
      <th>{basis.basis_type.substr(0,2)}</th>
      <td>{basis.text}</td>
      </tr>`

  render: ->
    if @trade
      `<div id="detail_content">
        <div className="impl_date">取引日：{this.trade.implimentation_date.substr(0,10)}</div>
        <div className="action_type">{this.trade.action_type}</div>
        <div className="product_type">{this.trade.tradable_type}</div>
        <table>
          <tbody>
           <tr><th>単価</th><td>{this.trade.invest_amount}</td></tr>
           <tr><th>数量</th><td>{this.trade.invest_quantity}</td></tr>
           <tr><th>利益</th><td>{this.trade.benefit_amount}</td></tr>
           <tr><th>騰落率</th><td>{this.trade.change_rate}</td></tr>
           <tr><th>利益率</th><td>{this.trade.benefit_rate}</td></tr>
          </tbody>
        </table>
        <div className="bases_wrapper">
          <table>
            <tbody>
              {this.renderBases()}
            </tbody>
          </table>
        </div>
      </div>`
    else
      `<div>No trade was found for TradeId: {this.props.params.tradeId}</div>`

module.exports = TradeLogDetail
