class API
  fetchTrades: ->
    $.ajax
        url: window.location.origin + "/api/trades"
        dataType: 'json'
        type: 'GET'
      .done (data) =>
        return data
      .fail (xhr, status, err) =>
        console.error @props.url, status, err.toString()

module.exports = new API()
