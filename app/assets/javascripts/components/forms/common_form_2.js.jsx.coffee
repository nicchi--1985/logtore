class CommonForm2 extends React.Component
  constructor: (props) ->
    super props

  getSubmitValues: ->
    implimented_date = @refs.implimented_date.value
    return implimented_date

  getInvestAmount: ->
    @refs.invest_amount.value if @refs.invest_amount

  getInvestQuantity: ->
    @refs.invest_quantity.value if @refs.invest_quantity

  getBenefitAmount: ->
    @refs.benefit_amount.value if @refs.benefit_amount

  getChangeRate: ->
    (@refs.change_rate.value / 100) if @refs.change_rate

  getBenefitRate: ->
    (@refs.benefit_rate.value / 100) if @refs.benefit_rate

  clearForm: ->
    @refs.invest_amount.value = "" if @refs.invest_amount
    @refs.invest_quantity.value = "" if @refs.invest_quantity
    @refs.benefit_amount.value = "" if @refs.benefit_amount
    @refs.change_rate.value = "" if @refs.change_rate
    @refs.benefit_rate.value = "" if @refs.benefit_rate

  renderFormForAction: ->
    switch @props.selectedAction
      # 新規 or 予想
      when "buy","forecast_buy","forecast_sell"
        `<div>
        <label>商品共通：</label>
        <div className="textFieldWP">
          <input type="number" pattern="\d*" placeholder="単価(円)" ref="invest_amount" />
        </div>
        <div className="textFieldWP">
          <input type="number" pattern="\d*" placeholder="数量(株)" ref="invest_quantity" />
        </div>
        </div>`
      # 損益確定
      when "sell"
        `<div>
          <label>商品共通：</label>
          <div className="textFieldWP">
            <input type="number" pattern="\d*" placeholder="単価(円)" ref="invest_amount" />
          </div>
          <div className="textFieldWP">
            <input type="number" pattern="\d*" placeholder="数量(株)" ref="invest_quantity" />
          </div>
          <div className="textFieldWP">
            <input type="number" pattern="\d*" placeholder="利益(円)" ref="benefit_amount" />
          </div>
          <div className="textFieldWP">
            <input type="number" pattern="\d*" placeholder="騰落率(%)" ref="change_rate" />
          </div>
          <div className="textFieldWP">
            <input type="number" pattern="\d*" placeholder="利益率(%)" ref="benefit_rate" />
          </div>
        </div>`
      else
        ``

  render: ->
    console.log @props
    `<div className="commonForm2WP">
      {this.renderFormForAction()}
    </div>`

module.exports = CommonForm2
