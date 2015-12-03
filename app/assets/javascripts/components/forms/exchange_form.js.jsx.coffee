class ExchangeForm extends React.Component
  render: ->
    `<div>
      <h4>this is ExchangeForm</h4>
      <select form="TradeForm" ref="action_type">
       <option value="">select action</option>
       <option value="0">新規</option>
       <option value="1">損益確定</option>
      </select>
      <input type="text" placeholder="ベース通貨" ref="target_code" />
      <input type="text" placeholder="相手通貨" ref="target_code" />
      <input type="text" placeholder="単価" ref="invest_amount" />
      <input type="text" placeholder="数量" ref="invest_quantity" />
      <input type="text" placeholder="利益" ref="benefit_amount" />
    </div>`

module.exports = ExchangeForm
