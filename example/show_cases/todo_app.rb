require 'kamiflex'
require 'clipboard'

@todos = [
  {
    background_color: "#27ACB2",
    state_color: "#0D8186",
    state: "In Progress",
    percentage: "70%",
    statement: "Buy milk and lettuce before class",
  },
  {
    background_color: "#FF6B6E",
    state_color: "#DE5658",
    state: "Pending",
    percentage: "30%",
    statement: "Wash my car",
  },
  {
    background_color: "#A17DF5",
    state_color: "#7D51E4",
    state: "In Progress",
    percentage: "100%",
    statement: "Buy milk and lettuce before class",
  }
]

json = Kamiflex.json(self) do
  alt_text "LINE Flex Message Showcase: TODO App"

  carousel do
    @todos.each do |todo|
      bubble size: :nano do
        header backgroundColor: todo[:background_color], paddingTop: "19px", paddingAll: "12px", paddingBottom: "16px" do
          text todo[:state], color: "#ffffff", align: :start, size: :md, gravity: :center
          text todo[:percentage], color: "#ffffff", align: :start, size: :xs, gravity: :center, margin: :lg
          vertical_box backgroundColor: "#9FD8E36E", height: "6px", margin: :sm do
            vertical_box width: todo[:percentage], backgroundColor: todo[:state_color], height: "6px" do
              filler
            end
          end
        end
        body spacing: :md, paddingAll: "12px" do
          horizontal_box flex: 1 do
            text todo[:statement], color: "#8C8C8C", size: :sm, wrap: true
          end
        end
        styles footer: { separator: false }
      end
    end
  end
end

puts json
Clipboard.copy json
