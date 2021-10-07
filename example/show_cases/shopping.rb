require 'kamiflex'
require 'clipboard'

@products = [
  {
    name: "Arm Chair, White",
    price: 49.99,
    inventory: true,
    image: "https://scdn.line-apps.com/n/channel_devcenter/img/fx/01_5_carousel.png"
  },
  {
    name: "Metal Desk Lamp",
    price: 11.99,
    inventory: false,
    image: "https://scdn.line-apps.com/n/channel_devcenter/img/fx/01_6_carousel.png"
  },
]

def shopping_price(price)
  baseline_box do
    price_parts = price.to_s.split(".")
    text "$#{price_parts[0]}", wrap: true, weight: :bold, size: :xl, flex: 0
    text ".#{price_parts[1]}", wrap: true, weight: :bold, size: :sm, flex: 0
  end
end

json = Kamiflex.json(self) do
  alt_text "LINE Flex Message Showcase: Shopping"

  carousel do
    bubbles @products do |product|
      hero product[:image], size: :full, aspectRatio: "20:13", aspectMode: :cover
      body spacing: :sm do
        text product[:name], wrap: true, weight: :bold, size: :xl
        shopping_price product[:price]
        unless product[:inventory]
          text "Temporarily out of stock", wrap: true, size: :xxs, margin: :md, color: "#ff5551", flex: 0
        end
      end
      footer do
        color = product[:inventory] ? "#00c300" : "#aaaaaa"
        url_button "Add to Cart", "https://linecorp.com", style: :primary, color: color
        url_button "Add to wishlist", "https://linecorp.com"
      end
    end
  end
end

puts json
Clipboard.copy json
