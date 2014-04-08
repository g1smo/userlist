define ['marionette', 'handlebars', 'text!tpl/userlist.tpl',
'cs!View/UserDetail', 'cs!Model/User', 'cs!App'],
(Marionette, Handlebars, tpl, UserDetail, User, App) ->
  UserView = Marionette.ItemView.extend
    template: Handlebars.compile '<a href="#">{{name}}</a>'
    tagName: 'li'
    triggers:
      'click': 'user:click'
      
  UserList = Marionette.CompositeView.extend
    template: Handlebars.compile '<div><ul class="nav nav-pills nav-stacked user-list"></ul>' +
    '<button class="btn btn-default btn-primary btn-add-user">Dodaj</button></div>'
    itemView: UserView
    itemViewContainer: ->
      'ul.user-list'
    triggers:
      'click .btn-add-user': 'user:add'
       
  Marionette.Layout.extend
    template: Handlebars.compile tpl
    regions:
      listR: '.user-list'
      detailR: '.user-view'
    initialize: ->
      this.userList = new UserList
        collection: this.collection
        
      this.listenTo this.userList, 'itemview:user:click', this.userView
          
      this.listenTo this.userList, 'itemview:user:new', (args) ->
        this.collection.add args.model
          
      this.listenTo this.userList, 'user:add', this.userAdd
        
    onRender: ->
      this.listR.show this.userList
    
    userAdd: ->
      Backbone.history.navigate 'add'
      this.detailR.show new UserDetail
        model: new User.Model
        newUser: true
    
    userView: (args) ->
      Backbone.history.navigate 'view/' + args.model.id
      this.detailR.show new UserDetail
        model: args.model