CommonForm = require('./common_form')
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
    @state = {selectedProduct: null}

  productSelected: (e) =>
    selectedProduct = e.target.value
    @setState selectedProduct: selectedProduct

  buildPostData: ->
    {
      trade: {
        user_id: "1",   # FIXME:ログイン機能追加後
        implimentation_date: @refs.commonForm.refs.implimented_date.value,
        action_type: @refs.selectedForm.refs.action_type.value,
        invest_amount: @refs.selectedForm.refs.invest_amount.value,
        invest_quantity: @refs.selectedForm.refs.invest_quantity.value,
        benefit_amount: @refs.selectedForm.refs.benefit_amount.value
      },
      product: {
        tradable_type: @props.selectedProduct,
        target_params: @refs.selectedForm.getTargetParams()
      },
      bases: @refs.basisForm.getBasesToSubmit()
    }

  clearFormParams: ->
    @refs.commonForm.refs.implimented_date.value = ""
    @refs.selectedForm.refs.action_type.value = ""
    @refs.selectedForm.refs.invest_amount.value = ""
    @refs.selectedForm.refs.invest_quantity.value = ""
    @refs.selectedForm.refs.benefit_amount.value = ""
    @refs.selectedForm.clearTargetParams()
    @refs.basisForm.clearBasesParams()

  submitForm: (e) =>
    postdata = @buildPostData()
    # 必須項目がなければ何もしない
    return unless Validator.validate_trade_post(postdata)
    @clearFormParams()
    # あとで実装。フォームをクリアする→clearFormParams
    ActionCreator.createTrade(postdata)

  createSelectedProductForm: =>
    switch @state.selectedProduct
      when null
        `<div>select your product</div>`
      when "stock"
        `<div>
          <StockForm ref="selectedForm" />
          {this.renderBasisForm()}
          {this.renderSubmitBtn()}
        </div>`
      when "future"
        `<div>
          <FutureForm ref="selectedForm" />
          {this.renderBasisForm()}
          {this.renderSubmitBtn()}
        </div>`
      when "option"
        `<div>
          <OptionForm ref="selectedForm" />
          {this.renderBasisForm()}
          {this.renderSubmitBtn()}
        </div>`
      when "exchange"
        `<div>
          <ExchangeForm ref="selectedForm" />
          {this.renderBasisForm()}
          {this.renderSubmitBtn()}
        </div>`
      else
        `<div>out of range</div>`

  renderBasisForm: =>
    `<BasisForm ref="basisForm" />`

  renderSubmitBtn: =>
    `<input type="button" value="記録" onClick={this.submitForm}/>`

  render: ->
    `<div>this is TradeLogForm
      <CommonForm productSelected={this.productSelected} ref="commonForm" />
      {this.createSelectedProductForm()}
     </div>`

module.exports = TradeLogForm
