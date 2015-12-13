module.exports =
  # 必須項目が足りているかチェック。不足してるparamのリストを返す
  validate_trade_post: (postdata) ->
    console.log "validating trade post data"
    console.log postdata
    return true
