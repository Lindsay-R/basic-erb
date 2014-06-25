require "erb_generator"

class HTMLGenerator < ERBGenerator

 def section(text)
   template = "<section> <%= section_text %> </section>"
   options_hash = {:locals => {:section_text => text}}
   erb template, options_hash
 end

  def unordered_list(items)
    template = <<-TEMPLATE
  <ul>
    <% html_items.each do |item| %>
      <li> <%= item %> </li>
    <% end %>
  </ul>
    TEMPLATE

    options_hash = {:locals => {:html_item => items}}
    erb template, options_hash
  end

end #end of class