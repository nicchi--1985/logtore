class StockForm extends React.Component
  getTargetParams: =>
    brand_code = @refs.brand_code.value
    return unless brand_code
    {brand_code: brand_code}

  clearTargetParams: =>
    @refs.brand_code.value = ""

  render: ->
    `<div>
      <h4>this is StockForm</h4>
      <select form="TradeForm" ref="action_type">
       <option value="">select action</option>
       <option value="0">新規</option>
       <option value="1">損益確定</option>
       <option value="2">予想</option>
      </select>
      <input type="text" placeholder="銘柄コード" ref="brand_code" />
      <input type="text" placeholder="単価(円)" ref="invest_amount" />
      <input type="text" placeholder="数量(株)" ref="invest_quantity" />
      <input type="text" placeholder="利益(円)" ref="benefit_amount" />
      <input type="text" placeholder="騰落率(%)" ref="benefit_amount" />
      <input type="text" placeholder="利益率(%)" ref="benefit_amount" />
    </div>`

module.exports = StockForm
