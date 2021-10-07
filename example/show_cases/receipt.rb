require 'kamiflex'
require 'clipboard'

def receipt_item(key, value, **options)
  horizontal_box **options do
    text key, size: "sm", color: "#555555", flex: 0
    text value, size: "sm", color: "#111111", align: "end"
  end
end

json = Kamiflex.json(self) do
  alt_text "LINE Flex Message Showcase: Receipt"

  bubble do
    body do
      vertical_box do
        text "RECEIPT", weight: :bold, color: "#1DB446", size: :sm
        text "Brown Store", weight: :bold, size: :xxl, margin: :md
        text "Miraina Tower, 4-1-6 Shinjuku, Tokyo", size: :xs, color: "#aaaaaa", wrap: true
        separator margin: :xxl, color: "#eaeaea"
        vertical_box margin: :xxl, spacing: :sm do
          receipt_item "Energy Drink", "$2.99"
          receipt_item "Chewing Gum", "$0.99"
          receipt_item "Bottled Water", "$3.33"
          separator margin: :xxl, color: "#eaeaea"
          receipt_item "ITEMS", "3", margin: :xxl
          receipt_item "TOTAL", "$7.31"
          receipt_item "CASH", "$8.0"
          receipt_item "CHANGE", "$0.69"
          separator margin: :xxl, color: "#eaeaea"
          horizontal_box margin: :md do
            text "PAYMENT ID", size: :xs, color: "#aaaaaa", flex: 0
            text "#743289384279", color: "#aaaaaa", size: :xs, align: :end
          end
        end
      end
    end
    styles footer: {separator: true}
  end
end

puts json
Clipboard.copy json
