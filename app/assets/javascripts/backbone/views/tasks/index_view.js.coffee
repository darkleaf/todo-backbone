TodoBackbone.Views.Tasks ||= {}

class TodoBackbone.Views.Tasks.IndexView extends Backbone.View
  template: JST["backbone/templates/tasks/index"]

  initialize: (options) ->
    super options
    @collection.bind('reset', @addAll)

  addAll: () =>
    @collection.each @addOne

  addOne: (task) =>
    view = new TodoBackbone.Views.Tasks.TaskView({model : task})
    @$('ul').append(view.render().el)

  render: =>
    @$el.html( @template(tasks: @collection.toJSON() ))
    @addAll()

    return this
