TradeLogForm = require('./forms/trade_log_form')
TradeLogTable = require('./trade_log_table')
API = require('../utils/api.coffee')

class TradeLogContainer extends React.Component
  constructor: (props) ->
    super
    @state = {data: []}

  componentDidMount: ->
    $.ajax
        url: window.location.origin + "/api/trades"
        dataType: 'json'
        type: 'GET'
      .done (data) =>
        console.log data
        @setState {data: data}
      .fail (xhr, status, err) =>
        console.error @props.url, status, err.toString()

  render: ->
    `<div>
      <TradeLogForm />
      <TradeLogTable trades={this.state.data} />
    </div>`

$ ->
  ReactDOM.render(
    `<TradeLogContainer />`,
    document.getElementById('content')
  )
