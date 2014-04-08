{{#if newUser}}
    <h3 class="user-new">Nov uporabnik</h3>
{{/if}}
<form>
    <div class="form-group">
        <label for="name">Ime</label>
        <input value="{{name}}" name="name" type="text" class="form-control">
    </div>
    <div class="form-group">
        <label for="name">Email</label>
        <input value="{{email}}" name="surname" type="text" class="form-control">
    </div>
    <div class="form-group">
        <label for="name">Vloga</label>
        <input value="{{role}}" name="email" type="text" class="form-control">
    </div>
</form>
<button class="btn btn-default btn-primary pull-right btn-user-save">Shrani</button>
<button class="btn btn-default btn-danger pull-right btn-user-delete">Briši</button>