require 'kamiflex'
require 'clipboard'

json = Kamiflex.json(self) do
  alt_text "LINE Flex Message Showcase: Menu"
  bubble do
    hero "https://scdn.line-apps.com/n/channel_devcenter/img/fx/01_2_restaurant.png", size: :full, aspectRatio: "20:13", aspectMode: :cover, action: uri_action("https://linecorp.com")
    body spacing: :md, action: uri_action("https://linecorp.com") do
      text "Brown's Burger", size: :xl, weight: :bold
      vertical_box do
        baseline_box do
          icon "https://scdn.line-apps.com/n/channel_devcenter/img/fx/restaurant_regular_32.png"
          text "$10.5", weight: :bold, margin: :sm, flex: 0
          text "400kcl", size: :sm, align: :end, color: "#aaaaaa"
        end

        baseline_box do
          icon "https://scdn.line-apps.com/n/channel_devcenter/img/fx/restaurant_large_32.png"
          text "$15.5", weight: :bold, margin: :sm, flex: 0
          text "550kcl", size: :sm, align: :end, color: "#aaaaaa"
        end
      end
      text "Sauce, Onions, Pickles, Lettuce & Cheese", wrap: true, color: "#aaaaaa", size: :xxs
    end

    footer do
      spacer size: :xxl
      url_button "Add to Cart", "https://linecorp.com", style: :primary, color: "#905c44"
    end
  end
end

puts json
Clipboard.copy json
