<Info>
  <div class="uk-card uk-card-default uk-width-1-2@m uk-align-center">
    <div class="uk-card-header">
      <h3 class="uk-card-title">{ type }</h3>
      <p class="uk-text-meta">{ begin } - { end != "0001-01-01T00:00:00Z" ? end : "" }</p>
    </div>
    <div class="uk-card-body">
      <p>{ detail }</p>
    </div>
    <div class="uk-card-footer" if="{ end == "0001-01-01T00:00:00Z" }">
      <a href="#edit" class="uk-button uk-button-text uk-align-right" uk-toggle>edit</a>
    </div>
  </div>

  <div id="edit" uk-modal>
    <div class="uk-modal-dialog uk-modal-body">
      <button class="uk-modal-close-outside" type="button" uk-close></button>
      <h2 class="uk-modal-title">edit End time</h2>
      <form onsubmit="{ submitEdit }">
        <fieldset class="uk-fieldset">
          <div class="uk-margin">
            <div class="label" for="end_edit_{ id }">end:</div>
            <input id="end_edit_{ id }" class="uk-input" name="end_edit_{ id }" type="date" placeholder="YYYY-MM-DD hh:mm:ss"/>
          </div>
          <div class="uk-margin">
            <input class="uk-input" name="token" type="text" placeholder="Token"/>
          </div>
          <p class="uk-text-right">
            <button class="uk-button uk-button-default uk-model-close" type="button">Cancel</button>
            <button class="uk-button uk-button-primary" type="submit">submit</button>
          </p>
        </fieldset>
      </form>
    </div>
  </div>

  <script>
   var self = this
   submitEdit(e) {
     var request = window.superagent
     var updateInfo = { end: e.target[1].value, token: e.target[2].value }
     request.put("/api/" + self.id)
            .send(updateInfo)
            .end(function(err, res) {
              self.update()
            })
   }
  </script>
</Info>
