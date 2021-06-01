require "kamiflex"
@events = [{
  backgroundColor: "#27ACB2",
  stateColor: "#0D8186",
  state: "In Progress",
  percentage: "70%",
  statement: "Buy milk and lettuce before class",
}, {
  backgroundColor: "#FF6B6E",
  stateColor: "#DE5658",
  state: "Pending",
  percentage: "30%",
  statement: "Wash my car",
}, {
  backgroundColor: "#A17DF5",
  stateColor: "#7D51E4",
  state: "In Progress",
  percentage: "100%",
  statement: "Buy milk and lettuce before class",
}]
json = Kamiflex.hash(self) do
  carousel do
    @events.each do |event|
      bubble size: "nano" do
        header backgroundColor: event[:backgroundColor], paddingTop: "19px", paddingAll: "12px", paddingBottom: "16px" do
          text event[:state], color: "#ffffff", align: "start", size: "md", gravity: "center"
          text event[:percentage], color: "#ffffff", align: "start", size: "xs", gravity: "center", margin: "lg"
          vertical_box backgroundColor: "#9FD8E36E", height: "6px", margin: "sm" do
            vertical_box width: event[:percentage], backgroundColor: event[:stateColor], height: "6px" do
              filler
            end
          end
        end
        body spacing: "md", paddingAll: "12px" do
          horizontal_box flex: 1 do
            text event[:statement], color: "#8C8C8C", size: "sm", wrap: true
          end
        end
        styles footer: { separator: false }
      end
    end
  end
end.to_json

puts json
