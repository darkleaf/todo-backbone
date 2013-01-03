TodoBackbone.Views.Tasks ||= {}

class TodoBackbone.Views.Tasks.IndexView extends Backbone.View
  template: JST["backbone/templates/tasks/index"]

  initialize: (options) ->
    super options
    @collection.bind 'reset', @addAll
    @collection.bind 'add', (task) =>
      @addOne task
      @drawNewForm()

  addAll: () =>
    @collection.each @addOne

  addOne: (task) =>
    view = @taskView task
    @$('ul').append(view.render().el)

  taskView: (task) =>
    view = new TodoBackbone.Views.Tasks.TaskView model : task
    view.on 'edit-click', @drawEditForm

  drawEditForm: (task, el) =>
    view = new TodoBackbone.Views.Tasks.EditView model: task
    view.on 'updated', @drawTask
    el.replaceWith(view.render().el)

  drawTask: (task, el) =>
    view = @taskView task
    el.replaceWith view.render().el

  drawNewForm: ->
    view = new TodoBackbone.Views.Tasks.NewView collection: @collection
    @$('.new-task').html(view.render().el)

  render: =>
    @$el.html( @template(tasks: @collection.toJSON() ))
    @drawNewForm()
    @addAll()

    return this
