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
    @state = {selectedProduct: null, selectedAction: null, startDate: moment()}

  productSelected: (e) =>
    selectedProduct = e.target.value
    @setState selectedProduct: selectedProduct

  actionSelected: (e) =>
    console.log @state
    selectedAction = e.target.value
    @setState selectedAction: selectedAction

  changeStartDate: (date) =>
    @setState startDate: date

  buildPostData: ->
    action = @refs.commonForm.getActionType()
    {
      trade: {
        user_id: "1",   # FIXME:ログイン機能追加後
        implimentation_date: @state.startDate.format("YYYY/MM/DD"),
        action_type: action.action_type
        forecast: action.forecast
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
    @refs.commonForm2.clearForm()
    @refs.selectedForm.clearTargetParams()
    @refs.basisForm.clearBasesParams()
    @setState {selectedProduct: null, selectedAction: null, startDate: null}

  submitForm: (e) =>
    postdata = @buildPostData()
    # 必須項目がなければ何もしない
    return unless Validator.validate_trade_post(postdata)

    ActionCreator.createTrade(postdata)
    @clearFormParams()

  createSelectedProductForm: =>
    switch @state.selectedProduct
      when null
        ``
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
      `<input className="submitBtn" type="button" value="記録" onClick={this.submitForm}/>`

  render: ->
    console.log @state
    `<div className="inputFormWP">
      <CommonForm productSelected={this.productSelected}
                  selectedProduct={this.state.selectedProduct}
                  actionSelected={this.actionSelected}
                  selectedAction={this.state.selectedAction}
                  startDate={this.state.startDate}
                  changeStartDate={this.changeStartDate}
                  ref="commonForm" />
      <div className="productFormWP">
      {this.createSelectedProductForm()}
      </div>
      <CommonForm2 selectedAction={this.state.selectedAction} ref="commonForm2"/>
      {this.renderBasisForm()}
      {this.renderSubmitBtn()}
     </div>`

module.exports = TradeLogForm
