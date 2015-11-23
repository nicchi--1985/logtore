window.TradeList = React.createClass
  render: ->
    tradeNodes = @props.data.map (trade) ->
      `<Trade key={trade.id}
              implimentation_date={trade.implimentation_date}
              invest_type={trade.invest_type}
              action_type={trade.action_type}
              target_code={trade.target_code}
              invest_amount={trade.invest_amount}
              invest_quantity={trade.invest_quantity}
              benefit_amount={trade.ibenefit_amount}>
      </Trade>`
    `<table className='TradeList'>
      <thead>
        <tr>
          <th>取引日</th>
          <th>取引種目</th>
          <th>取引タイプ</th>
          <th>識別コード</th>
          <th>単価</th>
          <th>数量</th>
          <th>利益</th>
        </tr>
      </thead>
      <tbody>
        {tradeNodes}
      </tbody>
    </table>`

Trade = React.createClass
  render: ->
    `<tr key={this.props.key}>
      <td>{this.props.implimentation_date.substr(0,10)}</td>
      <td>{this.props.invest_type}</td>
      <td>{this.props.action_type}</td>
      <td>{this.props.target_code}</td>
      <td>{this.props.invest_amount}</td>
      <td>{this.props.invest_quantity}</td>
      <td>{this.props.benefit_amount}</td>
     </tr>`
