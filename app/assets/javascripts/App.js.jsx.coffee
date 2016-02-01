Route = ReactRouter.Route
RouteHandler = ReactRouter.RouteHandler
DefaultRoute = ReactRouter.DefaultRoute
Link = ReactRouter.Link
TradeLogContainer = require('./components/index')
TradeLogDetail = require('./components/detail')
RecentLog = require('./components/recent_log')
SummaryLog = require('./components/summary_log')
ProductSummaryLog = require('./components/product_summary_log')


class TradeLogApp extends React.Component
  render: ->
    `<div>
      <ul>
      <li><Link to='/'>Top</Link></li>
      <li><Link to='/recent'>Recent</Link></li>
      <li><Link to='/summary'>Summary</Link></li>
      <li><Link to='/psummary'>Product Summary</Link></li>
      </ul>
      <RouteHandler />
     </div>`

routes = (
    `<Route name="app" path="/" handler={TradeLogApp}>
      <DefaultRoute handler={TradeLogContainer} />
      <Route handler={RecentLog} name='recent' path='recent'/>
      <Route handler={SummaryLog} name='summary' path='summary'/>
      <Route handler={ProductSummaryLog} name='psummary' path='psummary'/>
      <Route handler={TradeLogDetail} name='trades' path='/trades/:tradeId'/>
    </Route>`
  )

$ ->
  ReactRouter.run(routes, ReactRouter.HistoryLocation, (Handler) ->
    ReactDOM.render `<Handler/>`,
    document.getElementById('content')
  )
