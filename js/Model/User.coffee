define ['backbone'], (Backbone) ->
  User = Backbone.Model.extend
    url: ->
      url = 'http://someapi/list'
      if this.isNew
        return url + '/add'
      else
        return url + '/' + this.get('id')
  
  UserCollection = Backbone.Collection.extend
    model: User
    url: 'http://someapi/list'
  
  (
    Model: User
    Collection: UserCollection
  )
