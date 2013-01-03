TodoBackbone.Views.Tasks ||= {}

class TodoBackbone.Views.Tasks.TaskView extends Backbone.View
  template: JST["backbone/templates/tasks/task"]

  events:
    "click .edit"    : "edit"
    "click .destroy" : "destroy"

  tagName: "li"

  edit: ->
    this.trigger('edit-click', @model, @$el)
    return false

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    @$el.html(@template(@model.toJSON()))
    return this
