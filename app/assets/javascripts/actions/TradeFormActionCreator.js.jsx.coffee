###
AppDispatcher = require('../AppDispatcher')
AppConstants = require('../AppConstants')

ActionTypes = AppConstants.ActionTypes

module.exports = {
  
}
###

class TradeFormAction extends React.Component
  createTrade: (data) =>
    console.log data
    console.log window.location.protocol
    console.log window.location.host
    console.log window.location.origin

    $.ajax
        url: window.location.origin + "/api/trades"
        dataType: 'json'
        type: 'POST'
        data: data
      .done (data) =>
        @setState(data: data)
      .fail (xhr, status, err) =>
        console.error @props.url, status, err.toString()


module.exports = TradeFormAction
