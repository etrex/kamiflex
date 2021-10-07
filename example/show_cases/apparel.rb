require 'kamiflex'
require 'clipboard'

def delimited(number)
  number.to_s.reverse.scan(/.{1,3}/).join(',').reverse
end

@apparels = [
  {
    name: "Brown's T-shirts",
    price: 35800,
    original_price: 75000,
    color: "#03303Acc",
    image: "https://scdn.line-apps.com/n/channel_devcenter/img/flexsnapshot/clip/clip1.jpg"
  },
  {
    name: "Cony's T-shirts",
    price: 35800,
    original_price: 75000,
    color: "#9C8E7Ecc",
    image: "https://scdn.line-apps.com/n/channel_devcenter/img/flexsnapshot/clip/clip2.jpg"
  }
]

json = Kamiflex.json(self) do
  alt_text "LINE Flex Message Showcase: Apparel"
  carousel do
    bubbles @apparels do |apparel|
      body paddingAll: "0px" do
        # 主要圖片
        image apparel[:image], size: :full, aspectMode: :cover, aspectRatio: "2:3", gravity: :top

        vertical_box position: :absolute, offsetBottom: "0px", offsetStart: "0px", offsetEnd: "0px", backgroundColor: apparel[:color], paddingAll: "20px", paddingTop: "18px" do
          # 品名
          vertical_box do
            text apparel[:name], size: :xl, color: "#ffffff", weight: :bold
          end

          # 價格
          baseline_box spacing: :lg do
            text "¥#{delimited(apparel[:price])}", color: "#ebebeb", size: :sm, flex: 0
            text "¥#{delimited(apparel[:original_price])}", color: "#ffffffcc", decoration: "line-through", gravity: :bottom, flex: 0, size: :sm
          end

          # 加入購物車
          vertical_box borderWidth: "1px", cornerRadius: "4px", spacing: :sm, borderColor: "#ffffff", margin: :xxl, height: "40px" do
            filler
            baseline_box spacing: :sm do
              filler
              icon "https://scdn.line-apps.com/n/channel_devcenter/img/flexsnapshot/clip/clip14.png"
              text "Add to cart", color: "#ffffff", flex: 0, offsetTop: "-2px"
              filler
            end
            filler
          end
        end

        # 左上角的標記
        vertical_box position: :absolute, cornerRadius: "20px", offsetTop: "18px", backgroundColor: "#ff334b", offsetStart: "18px", height: "25px", width: "53px" do
          text "SALE", color: "#ffffff", align: :center, size: :xs, offsetTop: "3px"
        end
      end
    end
  end
end

puts json
Clipboard.copy json