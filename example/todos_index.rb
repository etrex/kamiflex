require 'kamiflex'

@todos = [
  {
    id: 1,
    name: "ruby"
  },
  {
    id: 2,
    name: "rails"
  },
  {
    id: 3,
    name: "kamiflex"
  }
]

json = Kamiflex.build(self) do
  bubble do
    body do
      horizontal_box do
        text "🍔", flex: 0, action: message_action("/")
        text "Todos"
        text "🆕", align: "end", action: uri_action("https://www.kamigo.tw")
      end
      separator
      unless @todos.nil?
        vertical_box margin: "lg" do
          horizontal_box @todos, margin: "lg" do |todo|
            text todo[:name], action: message_action("/todos/#{todo[:id]}")
            text "❌", align: "end", action: message_action("DELETE /todos/#{todo[:id]}")
          end
        end
      else
        text "no contents yet", margin: "lg"
      end
    end
  end
end

puts json