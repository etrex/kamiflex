require 'kamiflex'
require 'clipboard'

@local_searchs = [
  {
    name: "Brown Cafe",
    rating: 4,
    image: "https://scdn.line-apps.com/n/channel_devcenter/img/flexsnapshot/clip/clip10.jpg"
  },
  {
    name: "Brow&Cony's Restaurant",
    rating: 4,
    image: "https://scdn.line-apps.com/n/channel_devcenter/img/flexsnapshot/clip/clip11.jpg"
  },
  {
    name: "Tata",
    rating: 4,
    image: "https://scdn.line-apps.com/n/channel_devcenter/img/flexsnapshot/clip/clip12.jpg"
  },
]

def star_xs(n, m=5)
  baseline_box spacing: :xs do
    n.times do
      icon "https://scdn.line-apps.com/n/channel_devcenter/img/fx/review_gold_star_28.png", size: :xs
    end
    (m-n).times do
      icon "https://scdn.line-apps.com/n/channel_devcenter/img/fx/review_gray_star_28.png", size: :xs
    end
    text "#{n}.0", color: "#8c8c8c", size: :xs, margin: :md, flex: 0
  end
end

json = Kamiflex.json(self) do
  alt_text "LINE Flex Message Showcase: Local Search"
  carousel do
    bubbles @local_searchs, size: :micro do |local_search|
      hero local_search[:image], size: :full, aspectMode: "cover", aspectRatio: "320:213"
      body spacing: :sm, paddingAll: "13px" do
        text local_search[:name], weight: :bold, size: :sm, wrap: true

        star_xs local_search[:rating]

        vertical_box do
          baseline_box spacing: :sm do
            text "東京旅行", wrap: true, color: "#8c8c8c", size: :xs, flex: 5
          end
        end
      end
    end
  end
end

puts json
Clipboard.copy json
