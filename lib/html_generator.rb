require "erb_generator"

class HTMLGenerator < ERBGenerator

 def section(text)
   template = "<section> <%= my_text %> </section>"
   options_hash = {:locals => {:my_text => text}}
   erb template, options_hash
 end

  def unordered_list(items)
    template = <<-TEMPLATE
  <ul>
    <% list_html.each do |item| %>
      <li> <%= item %> </li>
    <% end %>
  </ul>
    TEMPLATE

    options_hash = {:locals => {:list_html => items}}
    erb template, options_hash
  end

  def button(text)
  template = "<button> <%= button_txt %> </button>"

    options_hash = {:locals => {:button_txt => text}}
    erb template, options_hash
  end

end #end of class