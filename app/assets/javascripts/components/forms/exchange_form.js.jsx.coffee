class ExchangeForm extends React.Component
  getTargetParams: =>
    base_currency = @refs.base_currency.value
    quote_currency = @refs.quote_currency.value
    return unless base_currency and quote_currency
    {
      base_currency: base_currency,
      quote_currency: quote_currency
    }

  render: ->
    `<div>
      <h4>this is ExchangeForm</h4>
      <select form="TradeForm" ref="action_type">
       <option value="">select action</option>
       <option value="0">新規</option>
       <option value="1">損益確定</option>
      </select>
      <input type="text" placeholder="ベース通貨" ref="base_currency" />
      <input type="text" placeholder="相手通貨" ref="quote_currency" />
      <input type="text" placeholder="単価" ref="invest_amount" />
      <input type="text" placeholder="数量" ref="invest_quantity" />
      <input type="text" placeholder="利益" ref="benefit_amount" />
    </div>`

module.exports = ExchangeForm
