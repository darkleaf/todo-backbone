TodoBackbone.Views.Tasks ||= {}

class TodoBackbone.Views.Tasks.NewView extends Backbone.View
  template: JST["backbone/templates/tasks/new"]

  events:
    "submit #new-task": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @collection.create @model.toJSON(),
      success: (task) =>
        @model = task

  render: ->
    @$el.html(@template(@model.toJSON()))
    this.$("form").backboneLink(@model)

    return this
