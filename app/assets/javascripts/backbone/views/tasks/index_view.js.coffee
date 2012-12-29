TodoBackbone.Views.Tasks ||= {}

class TodoBackbone.Views.Tasks.IndexView extends Backbone.View
  template: JST["backbone/templates/tasks/index"]

  initialize: () ->
    @options.tasks.bind('reset', @addAll)

  addAll: () =>
    @options.tasks.each(@addOne)

  addOne: (task) =>
    view = new TodoBackbone.Views.Tasks.TaskView({model : task})
    @$("tbody").append(view.render().el)

  render: =>
    @$el.html(@template(tasks: @options.tasks.toJSON() ))
    @addAll()

    return this
