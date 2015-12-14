class ExchangeForm extends React.Component
  getTargetParams: =>
    base_currency = @refs.base_currency.value
    quote_currency = @refs.quote_currency.value
    return unless base_currency and quote_currency
    {
      base_currency: base_currency,
      quote_currency: quote_currency
    }

  clearTargetParams: =>
    @refs.base_currency.value = ""
    @refs.quote_currency.value = ""

  render: ->
    `<div>
      <h4>this is ExchangeForm</h4>
      <select form="TradeForm" ref="action_type">
       <option value="">select action</option>
       <option value="0">新規</option>
       <option value="1">損益確定</option>
       <option value="2">予想</option>
      </select>
      <input type="text" placeholder="ベース通貨" ref="base_currency" />
      <input type="text" placeholder="相手通貨" ref="quote_currency" />
      <input type="text" placeholder="単価(円)" ref="invest_amount" />
      <input type="text" placeholder="数量(株)" ref="invest_quantity" />
      <input type="text" placeholder="利益(円)" ref="benefit_amount" />
      <input type="text" placeholder="騰落率(%)" ref="benefit_amount" />
      <input type="text" placeholder="利益率(%)" ref="benefit_amount" />
    </div>`

module.exports = ExchangeForm
