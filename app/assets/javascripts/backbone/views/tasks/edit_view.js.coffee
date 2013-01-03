TodoBackbone.Views.Tasks ||= {}

class TodoBackbone.Views.Tasks.EditView extends Backbone.View
  template: JST["backbone/templates/tasks/edit"]

  events:
    "submit #edit-task": "update"

  tagName: "li"

  update: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save null,
      success: (task) =>
        @model = task
        this.trigger('updated', @model, @$el)

  render: ->
    @$el.html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
