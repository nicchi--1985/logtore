CommonForm = require('./common_form')
CommonForm2 = require('./common_form_2')
StockForm = require('./stock_form')
FutureForm = require('./future_form')
OptionForm = require('./option_form')
ExchangeForm = require('./exchange_form')
BasisForm = require('./basis_form')
ActionCreator = require('../../actions/ActionCreator.coffee')
Validator = require('../../utils/Validator.coffee')

class TradeLogForm extends React.Component
  constructor: (props) ->
    super(props)
    @state = {selectedProduct: null, selectedAction: null}

  productSelected: (e) =>
    selectedProduct = e.target.value
    @setState selectedProduct: selectedProduct

  actionSelected: (e) =>
    console.log @state
    selectedAction = e.target.value
    @setState selectedAction: selectedAction

  buildPostData: ->
    {
      trade: {
        user_id: "1",   # FIXME:ログイン機能追加後
        implimentation_date: @refs.commonForm.refs.implimented_date.value,
        action_type: @state.selectedAction
        invest_amount: @refs.commonForm2.getInvestAmount(),
        invest_quantity: @refs.commonForm2.getInvestQuantity(),
        benefit_amount: @refs.commonForm2.getBenefitAmount(),
        change_rate: @refs.commonForm2.getChangeRate(),
        benefit_rate: @refs.commonForm2.getBenefitRate()
      },
      product: {
        tradable_type: @state.selectedProduct,
        target_params: @refs.selectedForm.getTargetParams()
      },
      bases: @refs.basisForm.getBasesToSubmit()
    }

  clearFormParams: ->
    @refs.commonForm.clearForm()
    @refs.commonForm2.clearForm()
    @refs.selectedForm.clearTargetParams()
    @refs.basisForm.clearBasesParams()
    @setState {selectedProduct: null, selectedAction: null}

  submitForm: (e) =>
    console.log @buildPostData()
    postdata = @buildPostData()
    # 必須項目がなければ何もしない
    return unless Validator.validate_trade_post(postdata)

    ActionCreator.createTrade(postdata)
    @clearFormParams()

  createSelectedProductForm: =>
    switch @state.selectedProduct
      when null
        `<div>select your product</div>`
      when "stock"
        `<div>
          <StockForm ref="selectedForm" />
        </div>`
      when "future"
        `<div>
          <FutureForm ref="selectedForm" />
        </div>`
      when "option"
        `<div>
          <OptionForm ref="selectedForm" />
        </div>`
      when "exchange"
        `<div>
          <ExchangeForm ref="selectedForm" />
        </div>`
      else
        `<div>out of range</div>`

  renderBasisForm: =>
    if @state.selectedProduct and @state.selectedAction
      `<BasisForm ref="basisForm" />`

  renderSubmitBtn: =>
    if @state.selectedProduct and @state.selectedAction
      `<input type="button" value="記録" onClick={this.submitForm}/>`

  render: ->
    `<div>this is TradeLogForm
      <CommonForm productSelected={this.productSelected}
                  actionSelected={this.actionSelected}
                  ref="commonForm" />
      {this.createSelectedProductForm()}
      <CommonForm2 selectedAction={this.state.selectedAction} ref="commonForm2"/>
      {this.renderBasisForm()}
      {this.renderSubmitBtn()}
     </div>`

module.exports = TradeLogForm
