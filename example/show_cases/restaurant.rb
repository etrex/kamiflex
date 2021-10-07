require 'kamiflex'
require 'clipboard'

json = Kamiflex.json(self) do
  alt_text "LINE Flex Message Showcase: Restaurant"

  bubble do
    hero "https://scdn.line-apps.com/n/channel_devcenter/img/fx/01_1_cafe.png",
      size: :full, aspectRatio: "20:13", aspectMode: :cover, action: uri_action("http://linecorp.com/")
    body do
      text "Brown Cafe", weight: :bold, size: :xl
      baseline_box margin: :md do
        icon "https://scdn.line-apps.com/n/channel_devcenter/img/fx/review_gold_star_28.png", size: :sm
        icon "https://scdn.line-apps.com/n/channel_devcenter/img/fx/review_gold_star_28.png", size: :sm
        icon "https://scdn.line-apps.com/n/channel_devcenter/img/fx/review_gold_star_28.png", size: :sm
        icon "https://scdn.line-apps.com/n/channel_devcenter/img/fx/review_gold_star_28.png", size: :sm
        icon "https://scdn.line-apps.com/n/channel_devcenter/img/fx/review_gray_star_28.png", size: :sm
        text "4.0", size: :sm, color: "#999999", margin: :md, flex: 0
      end
      vertical_box margin: :lg, spacing: :sm do
        baseline_box spacing: :sm do
          text "Place", color: "#aaaaaa", size: :sm, flex: 1
          text "Miraina Tower, 4-1-6 Shinjuku, Tokyo", wrap: true, color: "#666666", size: :sm, flex: 5
        end
        baseline_box spacing: :sm do
          text "Time", color: "#aaaaaa", size: :sm, flex: 1
          text "10:00 - 23:00", "wrap": true, color: "#666666", size: :sm, flex: 5
        end
      end
    end
    footer spacing: :sm, flex: 0 do
      url_button "CALL", "https://linecorp.com", style: :link, height: :sm
      url_button "WEBSITE", "https://linecorp.com", style: :link, height: :sm
      spacer size: :sm
    end
  end
end

puts json
Clipboard.copy json
