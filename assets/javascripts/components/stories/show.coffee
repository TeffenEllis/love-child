React              = require("react")
R                  = React.DOM
Firebase           = require("firebase")
ReactFireMixin     = require("reactfire")
documentHelper     = require("../../lib/document-helper")
apiPath            = require("../../lib/path-helper").api
View               = require("./shared/story")
ContentPlaceholder = require("../shared/content-placeholder")

module.exports = React.createClass
  displayName: "story-show"

  mixins: [ReactFireMixin]

  render: ->
    if @state.story
      View(story: @state.story)
    else
      ContentPlaceholder()

  componentDidUpdate: ->
    @setTitle()

  componentWillMount: ->
    @storyRef = new Firebase(apiPath("stories/#{@props.params.id}"))
    @bindAsObject(@storyRef, "story")

  getInitialState: ->
    story: null

  setTitle: ->
    title = @state.story.title
    documentHelper.title = title?.replace("&nbsp;", "") or "untitled"
