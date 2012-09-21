
                              user.relationships.build(followed_id: ...)

                                <ol class="microposts">
                                    <%= render @posts %>
                                  </ol>
                                  <%= will_paginate @posts %>

                                  <%= link_to image_tag("rails.png", alt: "Rails"), 'http://rubyonrails.org/' %>