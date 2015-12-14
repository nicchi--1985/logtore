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
    @refs.change_rate.value if @refs.change_rate

  getBenefitRate: ->
    @refs.benefit_rate.value if @refs.benefit_rate

  clearForm: ->
    @refs.invest_amount.value = "" if @refs.invest_amount
    @refs.invest_quantity.value = "" if @refs.invest_quantity
    @refs.benefit_amount.value = "" if @refs.benefit_amount
    @refs.change_rate.value = "" if @refs.change_rate
    @refs.benefit_rate.value = "" if @refs.benefit_rate

  renderFormForAction: ->
    switch @props.selectedAction
      # 新規 or 予想
      when "0" or "2"
        `<div>
        <input type="text" placeholder="単価(円)" ref="invest_amount" />
        <input type="text" placeholder="数量(株)" ref="invest_quantity" />
        </div>`
      # 損益確定
      when "1"
        `<div>
          <input type="text" placeholder="単価(円)" ref="invest_amount" />
          <input type="text" placeholder="数量(株)" ref="invest_quantity" />
          <input type="text" placeholder="利益(円)" ref="benefit_amount" />
          <input type="text" placeholder="騰落率(%)" ref="change_rate" />
          <input type="text" placeholder="利益率(%)" ref="benefit_rate" />
        </div>`
      else
        `<div>select your action</div>`

  render: ->
    console.log @props
    `<div>
      <h3>this is CommonForm2</h3>
      {this.renderFormForAction()}
    </div>`

module.exports = CommonForm2
