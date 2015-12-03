TradeLogForm = require('./forms/trade_log_form')
TradeLogTable = require('./trade_log_table')

class TradeLogContainer extends React.Component
  render: ->
    `<div>
      <TradeLogForm />
      <TradeLogTable />
    </div>`

$ ->
  ReactDOM.render(
    `<TradeLogContainer />`,
    document.getElementById('content')
  )
