TodoBackbone.Views.Tasks ||= {}

class TodoBackbone.Views.Tasks.TaskView extends Backbone.View
  template: JST["backbone/templates/tasks/task"]
  editTemplate: JST["backbone/templates/tasks/edit"]

  events:
    "click .edit"    : "edit"
    "click .destroy" : "destroy"
    "submit #edit-task": "update"

  tagName: "li"

  edit: ->
    @$el.html(@editTemplate(@model.toJSON() ))
    @$("form").backboneLink(@model)

  update: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save null,
      success: (task) =>
        @model = task
        @render()

  destroy: () ->
    @model.destroy()
    this.remove()

  render: ->
    @$el.html(@template(@model.toJSON()))
    return this
