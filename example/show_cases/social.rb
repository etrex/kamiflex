require 'kamiflex'
require 'clipboard'

json = Kamiflex.json(self) do
  alt_text "LINE Flex Message Showcase: Social"

  bubble do
    body paddingAll: "0px" do
      horizontal_box do
        image "https://scdn.line-apps.com/n/channel_devcenter/img/flexsnapshot/clip/clip7.jpg", size: "5xl", aspectMode: :cover, aspectRatio: "150:196", gravity: :center, flex: 1

        vertical_box flex: 1 do
          image "https://scdn.line-apps.com/n/channel_devcenter/img/flexsnapshot/clip/clip8.jpg", size: :full, aspectMode: :cover, aspectRatio: "150:98", gravity: :center
          image "https://scdn.line-apps.com/n/channel_devcenter/img/flexsnapshot/clip/clip9.jpg", size: :full, aspectMode: :cover, aspectRatio: "150:98", gravity: :center
        end
      end

      horizontal_box spacing: :xl, paddingAll: "20px" do
        vertical_box cornerRadius: "100px", width: "72px", height: "72px" do
          image "https://scdn.line-apps.com/n/channel_devcenter/img/flexsnapshot/clip/clip13.jpg", aspectMode: :cover, size: :full
        end

        vertical_box do
          text size: :sm, wrap: true do
            span "brown_05", weight: :bold, color: "#000000"
            span " "
            span "I went to the Brown&Cony cafe in Tokyo and took a picture"
          end

          baseline_box spacing: :sm, margin: :md do
            text "1,140,753 Like", size: :sm, color: "#bcbcbc"
          end
        end
      end
    end
  end
end

puts json
Clipboard.copy json
