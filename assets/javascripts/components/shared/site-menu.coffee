# Main menu component.
# Arguments:
# * navigationItems: Array of objects {label, icon, path}.

React = require("react")

{asset}    = require("../../helpers/path")
{debounce} = require("lodash")

SiteMenu = React.createClass
  displayName: "site-menu"

  render: ->
    <figure className="site-menu" onClick={@props.onNavigation}>
      <img className="logo-svg" src={asset("foundation/letters-logo-black.svg")} />
    </figure>

module.exports = SiteMenu
