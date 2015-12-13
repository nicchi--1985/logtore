class TradeLog extends React.Component
  render: ->
    `<tr>
      <td>{this.props.trade_id}</td>
      <td>{this.props.implimentation_date}</td>
      <td>{this.props.action_type}</td>
      <td>{this.props.product_type}</td>
      <td>{this.props.invest_amount}</td>
      <td>{this.props.invest_quantity}</td>
     </tr>`

module.exports = TradeLog
