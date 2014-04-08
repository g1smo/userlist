define ['marionette', 'handlebars', 'text!tpl/form.tpl'],
(Marionette, Handlebars, tpl) ->
  Marionette.ItemView.extend
    template: Handlebars.compile(tpl)
    ui:
      name: 'input[name="name"]'
      email: 'input[name="email"]'
      role: 'input[name="role"]'
      
    triggers:
      'click .btn-user-save': 'user:save'
      'click .btn-user-delete': 'user:delete'
      
    initialize: (opts) ->
      this.newUser = opts.newUser or false
      
    serializeData: ->
      data = this.model.attributes
      data.newUser = this.newUser
      data
        
    onUserSave: ->
      this.model.set
        name: this.ui.name.val()
        email: this.ui.email.val()
        role: this.ui.role.val()
      
      if this.model.isNew
        this.trigger 'user:new'
      this.model.save()
        
    onUserDelete: ->
      this.model.destroy