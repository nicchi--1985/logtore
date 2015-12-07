CommonForm = require('./common_form')
StockForm = require('./stock_form')
FutureForm = require('./future_form')
OptionForm = require('./option_form')
ExchangeForm = require('./exchange_form')
BasisForm = require('./basis_form')
APIConnector = require('../../actions/APIConnector')

class TradeLogForm extends React.Component
  constructor: (props) ->
    super(props)
    @state = {
              selectedProduct: null,
              bases: ["basis_1"]
            }
    @api = new APIConnector()

  productSelected: (e) =>
    console.log @props
    selectedProduct = e.target.value
    @setState selectedProduct: selectedProduct
    console.log "product-> " + selectedProduct + " was selected!"

  addBasis: (e) =>
    console.log "addBasis triggered"
    bases = @state.bases
    next_basis = "basis_" + (bases.length + 1)
    bases.push next_basis
    @setState bases: bases

  pushedSubmit: (e) =>
    implimented_date = @refs.commonForm.refs.implimented_date.value
    action_type = @refs.selectedForm.refs.action_type.value
    target_type = @state.selectedProduct
    target_params = @refs.selectedForm.getTargetParams()
    invest_amount = @refs.selectedForm.refs.invest_amount.value
    invest_quantity = @refs.selectedForm.refs.invest_quantity.value
    benefit_amount = @refs.selectedForm.refs.benefit_amount.value
    bases = @refs.basisForm.getBasesToSubmit()
    # 必須項目がなければ何もしない
    return unless implimented_date

    @api.createTrade(
      trade: {
        user_id: "1",  # FIXME:ログイン機能追加後
        implimentation_date: implimented_date,
        action_type: action_type,
        invest_amount: invest_amount,
        invest_quantity: invest_quantity,
        benefit_amount: benefit_amount,
      },
      product: {
        tradable_type: target_type,
        target_params: target_params
      }
      bases: bases)
    console.log "submited!!"

  render: ->
    selectedProduct = (()=>
        console.log "is selected ->" + @state.selectedProduct
        bases = @state.bases
        addBasis = @addBasis
        switch @state.selectedProduct
          when null
            `<div>select your product</div>`
          when "stock"
            `<div><StockForm ref="selectedForm" />
            <BasisForm addBasis={addBasis} bases={bases} ref="basisForm" /></div>`
          when "future"
            `<div><FutureForm ref="selectedForm" />
            <BasisForm addBasis={addBasis} bases={bases} ref="basisForm" /></div>`
          when "option"
            `<div><OptionForm ref="selectedForm" />
            <BasisForm addBasis={addBasis} bases={bases} ref="basisForm" /></div>`
          when "exchange"
            `<div><ExchangeForm ref="selectedForm" />
            <BasisForm addBasis={addBasis} bases={bases} ref="basisForm" /></div>`
          else
            `<div>out of range</div>`
      )()
    submitBtn = (()=>
        pushedSubmit = @pushedSubmit
        if @state.selectedProduct != null
          `<input type="button" value="記録" onClick={pushedSubmit}/>`
      )()
    console.log selectedProduct
    `<div>this is TradeLogForm
      <CommonForm productSelected={this.productSelected} ref="commonForm" />
      {selectedProduct}
      {submitBtn}
     </div>`

module.exports = TradeLogForm
