class TodoBackbone.Models.Task extends Backbone.Model
  paramRoot: 'task'

  defaults:
    content: null

class TodoBackbone.Collections.TasksCollection extends Backbone.Collection
  model: TodoBackbone.Models.Task
  url: '/tasks'
