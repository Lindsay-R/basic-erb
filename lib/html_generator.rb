require "erb_generator"

class HTMLGenerator < ERBGenerator
  def initialize(layout = nil)
    @layout = layout || "CONTENT"
  end

 def section(text)
   template = "<section> <%= some_text%> </section>"
   options_hash = {:locals => {:some_text => text}}
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

  def button(text, options = {})
  #template = "<button> <%= button_txt %> </button>"
    template = <<-TEMPLATE

    <% if options_hash[:class] %>
    <button class= '<%= options_hash[:class] %>' >
    <% else %>
    <button>
    <% end %>
    <%= button_txt %></button>
    TEMPLATE


    options_hash = {:locals => {:button_txt => text, :options_hash => options}}
    erb template, options_hash
  end



  def layout(inner_html)
    template = "<main><section> '<%= something %>' </section></main>"
    options_hash = {:locals => {:something => inner_html}}
    erb template, options_hash
  end


end #end of class