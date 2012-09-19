
                              user.relationships.build(followed_id: ...)

                                <ol class="microposts">
                                    <%= render @posts %>
                                  </ol>
                                  <%= will_paginate @posts %>