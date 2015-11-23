$ ->

  converter = new Showdown.converter()

  TradeBox = React.createClass

    loadTradesFromServer: ->
      $.ajax
        url: @props.url
        dataType: 'json'
      .done (data) =>
        @setState(data: data)
      .fail (xhr, status, err) =>
        console.error @props.url, status, err.toString()

    handleTradeSubmit: (trade) ->
      # ajaxしてたらラグがあるので先に描画
      trades = @state.data
      newtrades = trades.concat([trade])
      @setState(data: newtrades)

      $.ajax
        url: @props.url
        dataType: 'json'
        type: 'POST'
        data: trade: trade
      .done (data) =>
        @setState(data: data)
      .fail (xhr, status, err) =>
        console.error @props.url, status, err.toString()

    getInitialState: -> data: []

    componentDidMount: ->
      @loadTradesFromServer()
      setInterval @loadtradesFromServer, @props.pollInterval

    render: ->
      `<div className='TradeBox'>
        <h1>TradeLog</h1>
        <BaseForm onTradeSubmit={this.handleTradeSubmit}/>
        <TradeList data={this.state.data} />
      </div>`

  ReactDOM.render(
    `<TradeBox url='/api/trades' pollInterval={2000} />`,
    $('#content')[0]
  )
