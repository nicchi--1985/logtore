class CommonForm extends React.Component
  constructor: (props) ->
    super props

  getActionType: ->
    switch @props.selectedAction
      when "buy"
        {action_type: 0, forecast: false}
      when "sell"
        {action_type: 1, forecast: false}
      when "forecast_buy"
        {action_type: 0, forecast: true}
      when "forecast_sell"
        {action_type: 1, forecast: true}

  render: ->
    `<div>
      <div className="datePickerWP">
      <label>取引日：</label>
      <DatePicker selected={this.props.startDate}
                   onChange={this.props.changeStartDate}
                   dateFormat="YYYY/MM/DD"
                   placeholderText="select trade date"
                   ref="implimentation_date"
                   className="datePicker" />
      </div>
      <ProductTypeSelector productSelected={this.props.productSelected}
                           selectedProduct={this.props.selectedProduct}
                           ref="product" />
      <ActionTypeSelector actionSelected={this.props.actionSelected}
                          selectedAction={this.props.selectedAction}
                          ref="action" />
    </div>`

class ProductTypeSelector extends React.Component
  constructor: (props) ->
    super props
    @data = [{id:"common_stock", value:"stock", labelValue:"株式"},
            {id:"common_future", value:"future", labelValue:"先物"},
            {id:"common_option", value:"option", labelValue:"オプション"},
            {id:"common_exchange", value:"exchange", labelValue:"為替"},]

  isChecked: (data) ->
    if @props.selectedProduct is data.value then "checked" else ""

  renderInputs: () ->
    inputs = @data.map (inData) =>
      checked = @isChecked(inData)
      onClickFunc = @props.productSelected
      `<div className="buttonWP" key={inData.id}>
        <input type="radio"
               id={inData.id}
               name="product"
               value={inData.value}
               checked={checked}
               onClick={onClickFunc} />
        <label htmlFor={inData.id} className="productBtn">
        {inData.labelValue}
        </label>
      </div>`

  render: ->
    `<div>
    <label>商品種類：</label>
    <div className="productSelectorWP">
      {this.renderInputs()}
     </div>
    </div>`

class ActionTypeSelector extends React.Component
  constructor: (props) ->
    super props
    @data = [{id:"common_buy", value:"buy", labelValue:"買い"},
            {id:"common_sell", value:"sell", labelValue:"売り"},
            {id:"common_forecast_buy", value:"forecast_buy", labelValue:"買い予想"},
            {id:"common_forecast_sell", value:"forecast_sell", labelValue:"売り予想"},]

  isChecked: (data) ->
    if @props.selectedAction is data.value then "checked" else ""

  renderInputs: () ->
    inputs = @data.map (inData) =>
      checked = @isChecked(inData)
      onClickFunc = @props.actionSelected
      `<div className="buttonWP" key={inData.id}>
        <input type="radio"
               id={inData.id}
               name="action"
               value={inData.value}
               checked={checked}
               onClick={onClickFunc} />
        <label htmlFor={inData.id} className="actionBtn">
        {inData.labelValue}
        </label>
      </div>`

  render: ->
    `<div>
    <label>アクションタイプ：</label>
    <div className="actionSelectorWP">
      {this.renderInputs()}
     </div>
    </div>`

module.exports = CommonForm
