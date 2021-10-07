require 'kamiflex'
require 'clipboard'

def star_sm(n, m=5)
  baseline_box margin: :md do
    n.times do
      icon "https://scdn.line-apps.com/n/channel_devcenter/img/fx/review_gold_star_28.png", size: :sm
    end
    (m-n).times do
      icon "https://scdn.line-apps.com/n/channel_devcenter/img/fx/review_gray_star_28.png", size: :sm
    end
    text "#{n}.0", color: "#999999", size: :sm, margin: :md, flex: 0
  end
end

json = Kamiflex.json(self) do
  alt_text "LINE Flex Message Showcase: Ticket"

  bubble do
    hero "https://scdn.line-apps.com/n/channel_devcenter/img/fx/01_3_movie.png", size: :full, aspectRatio: "20:13", aspectMode: :cover, action: uri_action("http://linecorp.com/")
    body spacing: :md do
      text "BROWN'S ADVENTURE\nIN MOVIE", wrap: true, weight: :bold, gravity: :center, size: :xl
      star_sm 4
      vertical_box margin: :lg, spacing: :sm do
        baseline_box spacing: :sm do
          text "Date", color: "#aaaaaa", size: :sm, flex: 1
          text "Monday 25, 9:00PM", wrap: true, size: :sm, color: "#666666", flex: 4
        end

        baseline_box spacing: :sm do
          text "Place", color: "#aaaaaa", size: :sm, flex: 1
          text "7 Floor, No.3", wrap: true, color: "#666666", size: :sm, flex: 4
        end

        baseline_box spacing: :sm do
          text "Seats", "color": "#aaaaaa", size: :sm, flex: 1
          text "C Row, 18 Seat", wrap: true, color: "#666666", size: :sm, flex: 4
        end
      end

      vertical_box margin: :xxl do
        spacer
        image "https://scdn.line-apps.com/n/channel_devcenter/img/fx/linecorp_code_withborder.png", aspectMode: :cover, size: :xl
        text "You can enter the theater by using this code instead of a ticket", color: "#aaaaaa", wrap: true, margin: :xxl, size: :xs
      end
    end
  end
end

puts json
Clipboard.copy json
