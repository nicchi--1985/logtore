class CommonForm extends React.Component
  constructor: (props) ->
    super props

  clearForm: ->
    @refs.implimentation_date.value = ""
    @refs.product.refs.selector.value = ""
    @refs.action.refs.selector.value = ""

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
                           ref="product" />
      <ActionTypeSelector actionSelected={this.props.actionSelected}
                          ref="action" />
    </div>`

class ProductTypeSelector extends React.Component

  render: ->
    `<div>
    <label>商品種類：</label>
    <div className="productSelectorWP">
      <div className="buttonWP">
        <input type="radio"
               id="common_stock"
               name="product"
               value="stock"
               onClick={this.props.productSelected} />
        <label htmlFor="common_stock" className="productBtn">
        株式
        </label>
      </div>
      <div className="buttonWP">
        <input type="radio"
               id="common_future"
               name="product"
               value="future"
               onClick={this.props.productSelected} />
        <label htmlFor="common_future" className="productBtn">先物</label>
      </div>
      <div className="buttonWP">
        <input type="radio"
               id="common_option"
               name="product"
               value="option"
               onClick={this.props.productSelected} />
        <label htmlFor="common_option" className="productBtn">オプション</label>
      </div>
      <div className="buttonWP">
        <input type="radio"
               id="common_exchange"
               name="product"
               value="exchange"
               onClick={this.props.productSelected}/>
        <label htmlFor="common_exchange" className="productBtn">為替</label>
      </div>
     </div>
    </div>`

class ActionTypeSelector extends React.Component

  render: ->
    `<div>
    <label>アクションタイプ：</label>
    <div className="actionSelectorWP">
      <div className="buttonWP">
        <input type="radio"
               id="common_buy"
               name="action"
               value="buy"
               onClick={this.props.actionSelected} />
        <label htmlFor="common_buy" className="actionBtn">買い</label>
      </div>
      <div className="buttonWP">
        <input type="radio"
               id="common_sell"
               name="action"
               value="sell"
               onClick={this.props.actionSelected} />
        <label htmlFor="common_sell" className="actionBtn">売り</label>
      </div>
      <div className="buttonWP">
        <input type="radio"
               id="common_forecast_buy"
               name="action"
               value="forecast_buy"
               onClick={this.props.actionSelected} />
        <label htmlFor="common_forecast_buy" className="actionBtn">買い予想</label>
      </div>
      <div className="buttonWP">
        <input type="radio"
               id="common_forecast_sell"
               name="action"
               value="forecast_sell"
               onClick={this.props.actionSelected} />
        <label htmlFor="common_forecast_sell" className="actionBtn">売り予想</label>
      </div>
     </div>
    </div>`

module.exports = CommonForm
