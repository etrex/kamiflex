require 'kamiflex'

def item(key, value)
  horizontal_box do
    text key, size: "sm", color: "#555555", flex: 0
    text value, size: "sm", color: "#111111", align: "end"
  end
end

json = Kamiflex.json(self) do
  bubble do
    body do
      vertical_box do
        text "RECEIPT", weight: "bold", color: "#1DB446", size: "sm"
        text "Brown Store", weight: "bold", size: "xxl", margin: "md"
        text "Miraina Tower, 4-1-6 Shinjuku, Tokyo", size: "xs", color: "#aaaaaa", wrap: true
        separator
        vertical_box margin: "xxl", spacing: "sm" do
          item "Energy Drink", "$2.99"
          item "Bottled Water", "$0.99"
          item "$3.33", "$0.99"
          separator
          item "ITEMS", "3"
          item "TOTAL", "$7.31"
          item "CASH", "$8.0"
          item "CHANGE", "$0.69"
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