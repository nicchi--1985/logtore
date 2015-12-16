class BasisForm extends React.Component
  constructor: (props) ->
    super props
    @state = {bases: ["basis_1"]}

  getBasesToSubmit: =>
    refIDs = Object.keys(@refs)
    res = refIDs.map (refID) =>
      {
        basis_type: @refs[refID].refs.basis_type.value,
        text: @refs[refID].refs.basis_text.value
      }
    return res

  clearBasesParams: =>
    @refs.basis_1.refs.basis_text.value = ""
    @refs.basis_1.refs.basis_type.value = 0
    @setState bases: ["basis_1"]

  addBasis: (e) =>
    bases = @state.bases
    next_basis = "basis_" + (bases.length + 1)
    bases.push next_basis
    @setState bases: bases

  render: =>
    bases = @state.bases.map (id) ->
      `<Basis key={id} ref={id} />`

    `<div>
      <label>取引理由：</label>
      {bases}
      <input className="addBasisBtn" type="button" value="+" onClick={this.addBasis} />
    </div>`
    #<input type="button" onClick={this.clearBasesParams} value="clear" />

class Basis extends React.Component
  constructor: (props) ->
    super props

  render: ->
    `<div id={this.props.key}>
      <select className="basisSelector" ref="basis_type">
        <option value="0">テクニカル</option>
        <option value="1">ファンダメンタルズ</option>
        <option value="2">アノマリー</option>
      </select>
      <div className="textAreaWP">
        <input className="basisText" type="textarea" placeholder="理由" ref="basis_text"/>
      </div>
     </div>`

module.exports = BasisForm
