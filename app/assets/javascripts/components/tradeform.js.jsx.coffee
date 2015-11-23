window.BaseForm = React.createClass
  handleSubmit: (e) ->
    e.preventDefault()
    implimentation_date = @refs.implimentation_date.getDOMNode().value.trim()
    invest_type = @refs.invest_type.getDOMNode().value.trim()
    action_type = @refs.action_type.getDOMNode().value.trim()
    target_code = @refs.target_code.getDOMNode().value.trim()
    invest_amount = @refs.invest_amount.getDOMNode().value.trim()
    invest_quantity = @refs.invest_quantity.getDOMNode().value.trim()
    benefit_amount = @refs.benefit_amount.getDOMNode().value.trim()
    # 必須項目がない場合は、何もしない
    return unless \
            implimentation_date and
            invest_type and
            action_type

    #@props.onTradeSubmit(implimentation_date: implimentation_date, \
    #                     invest_type: invest_type, \
    #                     action_type: action_type, \
    #                     target_code: target_code, \
    #                     invest_amount: invest_amount, \
    #                     invest_quantity: invest_quantity, \
    #                     benefit_amount: benefit_amount
    #                     )
    # フォーム初期化
    @refs.implimentation_date.getDOMNode().value = ''
    @refs.invest_type.getDOMNode().value = ''
    @refs.action_type.getDOMNode().value = ''
    @refs.target_code.getDOMNode().value = ''
    @refs.invest_amount.getDOMNode().value = ''
    @refs.invest_quantity.getDOMNode().value = ''
    @refs.benefit_amount.getDOMNode().value = ''

  getInitialState: -> {
    startDate: moment(),
    formType: ""
    }

  changeStartDate: (date) -> @setState(startDate: date)

  changeForm: (e) ->
    @setState(formType: e.target.value)

  render: ->
     console.log this.state.formType
     `<form className="TradeForm" onSubmit={ this.handleSubmit }>
       <DatePicker selected={this.state.startDate}
                   onChange={this.changeStartDate}
                   form="TradeForm"
                   ref="implimentation_date" />
       <SelectInvestType form="TradeForm" ref="invest_type" onChange={this.changeForm} />
       <FormDetail renderType={this.state.formType}/>
     </form>`
