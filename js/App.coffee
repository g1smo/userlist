define ['marionette', 'cs!Model/User', 'cs!View/UserList'],
(Marionette, User, UserList) ->
  App = new Marionette.Application
  App.addRegions
    userList: '#userList'
    
  Router = Backbone.Router.extend
    routes:
      'add': 'userAdd'
      'view/:id': 'userView'

    userAdd: ->
      App.userView.userAdd

    userView: (id) ->
      App.userView.userView {model: {id: id}}
      
  App.addInitializer ->
    userCollection = new User.Collection
      
    this.userView = new UserList
      collection: userCollection
      
    this.userList.show(this.userView)
    userCollection.fetch()
    
    router = new Router
    Backbone.history.start()

  App
  