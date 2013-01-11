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
    view = new TodoBackbone.Views.Tasks.TaskView model : task
    @$('ul').append(view.render().el)

  drawNewForm: ->
    view = new TodoBackbone.Views.Tasks.NewView collection: @collection
    @$('.new-task').html(view.render().el)

  render: =>
    @$el.html( @template(tasks: @collection.toJSON() ))
    @drawNewForm()
    @addAll()

    return this
