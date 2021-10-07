require 'kamiflex'
require 'clipboard'

def star(num)
  baseline_box margin: :md do
    (0...num).each do
      icon "https://scdn.line-apps.com/n/channel_devcenter/img/fx/review_gold_star_28.png", size: :sm
    end
    (num...5).each do
      icon "https://scdn.line-apps.com/n/channel_devcenter/img/fx/review_gray_star_28.png", size: :sm
    end
    text "#{num}.0", size: :sm, color: "#999999", margin: :md, flex: 0
  end
end

json = Kamiflex.json(self) do
  alt_text "LINE Flex Message Showcase: Hotel"
  bubble do
    body paddingAll: "0px" do
      image "https://scdn.line-apps.com/n/channel_devcenter/img/flexsnapshot/clip/clip3.jpg", size: :full, aspectMode: :cover, aspectRatio: "1:1", gravity: :center

      vertical_box position: :absolute, width: "100%", height: "40%", offsetBottom: "0px", offsetStart: "0px", offsetEnd: "0px",
        background: {
          type: :linearGradient,
          angle: "0deg",
          endColor: "#00000000",
          startColor: "#00000099"
        } do
      end

      horizontal_box position: :absolute, offsetBottom: "0px", offsetStart: "0px", offsetEnd: "0px", paddingAll: "20px" do
        vertical_box spacing: :xs do
          horizontal_box do
            text "Brown Grand Hotel", size: :xl, color: "#ffffff"
          end

          star 4

          horizontal_box do
            baseline_box spacing: :lg, flex: 0 do
              text "¥62,000", color: "#ffffff", size: :md, flex: 0, align: :end
              text "¥82,000", color: "#a9a9a9", decoration: "line-through", size: :sm, align: :end
            end
          end
        end
      end
    end
  end
end

puts json
Clipboard.copy json