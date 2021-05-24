require 'kamiflex'
json = Kamiflex.json(self) do
  bubble do
    body do
      vertical_box do
        text "RECEIPT", weight: "bold", color: "#1DB446", size: "sm"
        text "Brown Store", weight: "bold", size: "xxl", margin: "md"
        text "Miraina Tower, 4-1-6 Shinjuku, Tokyo", size: "xs", color: "#aaaaaa", wrap: true
        separator
        vertical_box margin: "xxl", spacing: "sm" do
          horizontal_box do
            text "Energy Drink", size: "sm", color: "#555555", flex: 0
            text "$2.99", size: "sm", color: "#111111", align: "end"
          end
          horizontal_box do
            text "Chewing Gum", size: "sm", color: "#555555", flex: 0
            text "$0.99", size: "sm", color: "#111111", align: "end"
          end
          horizontal_box do
            text "Bottled Water", size: "sm", color: "#555555", flex: 0
            text "$3.33", size: "sm", color: "#111111", align: "end"
          end
          separator
          horizontal_box do
            text "ITEMS", size: "sm", color: "#555555"
            text "3", size: "sm", color: "#111111", align: "end"
          end
          horizontal_box do
            text "TOTAL", size: "sm", color: "#555555"
            text "$7.31", size: "sm", color: "#111111", align: "end"
          end
          horizontal_box do
            text "CASH", size: "sm", color: "#555555"
            text "$8.0", size: "sm", color: "#111111", align: "end"
          end
          horizontal_box do
            text "CHANGE", size: "sm", color: "#555555"
            text "$0.69", size: "sm", color: "#111111", align: "end"
          end
          separator
          horizontal_box margin: "md" do
            text "PAYMENT ID", size: "xs", color: "#aaaaaa", flex: 0
            text "#743289384279", color: "#aaaaaa", size: "xs", align: "end"
          end
        end
      end
    end
    styles footer: {separator: true}
  end
end
puts json
