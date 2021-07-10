require "kamiflex"

# 資料表
class Product
  attr_accessor :name
  attr_accessor :price
  attr_accessor :image
  attr_accessor :inventory
  def initialize(name:, price:, inventory:, image:)
    self.name = name
    self.price = price
    self.inventory = inventory
    self.image = image
  end
end

# 資料
products = [
  Product.new(
    name: "Arm Chair, White",
    price: 49.99,
    inventory: true,
    image: "https://scdn.line-apps.com/n/channel_devcenter/img/fx/01_5_carousel.png"
  ),
  Product.new(
    name: "Metal Desk Lamp",
    price: 11.99,
    inventory: false,
    image: "https://scdn.line-apps.com/n/channel_devcenter/img/fx/01_6_carousel.png"
  ),
  Product.new(
    name: "3",
    price: 3.3,
    inventory: false,
    image: "https://scdn.line-apps.com/n/channel_devcenter/img/fx/01_6_carousel.png"
  )
]

# 模組化的價格
def render_price(price)
  baseline_box do
    price_parts = price.to_s.split(".")
    text "$#{price_parts[0]}", wrap: true, weight: :bold, size: :xl, flex: 0
    text ".#{price_parts[1]}", wrap: true, weight: :bold, size: :sm, flex: 0
  end
end

# flex message
def to_flex(products)
  Kamiflex.hash(self) do
    carousel do
      bubbles products.first(2) do |product|
        hero product.image, size: :full, aspectRatio: "20:13", aspectMode: :cover
        body spacing: :sm do
          text product.name, wrap: true, weight: :bold, size: :xl
          render_price product.price
          unless product.inventory
            text "Temporarily out of stock", wrap: true, size: :xxs, margin: :md, color: "#ff5551", flex: 0
          end
        end
        footer do
          color = product.inventory ? "#00c300" : "#aaaaaa"
          url_button "Add to Cart", "https://linecorp.com", style: :primary, color: color
          url_button "Add to wishlist", "https://linecorp.com"
        end
      end
      bubble do
        body do
          url_button "See more", "https://linecorp.com", flex: 1, gravity: :center
        end
      end if products.length > 2
    end
  end
end

# 實際呼叫
puts to_flex(products).to_json