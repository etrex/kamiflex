require 'kamiflex'
require 'clipboard'

json = Kamiflex.json(self) do
  alt_text "LINE Flex Message Showcase: Real Estate"

  bubble do
    header paddingAll: "0px" do
      horizontal_box do
        image "https://scdn.line-apps.com/n/channel_devcenter/img/flexsnapshot/clip/clip4.jpg", size: :full, aspectMode: :cover, aspectRatio: "150:196", gravity: :center, flex: 1
        vertical_box flex: 1 do
          image "https://scdn.line-apps.com/n/channel_devcenter/img/flexsnapshot/clip/clip5.jpg", size: :full, aspectMode: :cover, aspectRatio: "150:98", gravity: :center
          image "https://scdn.line-apps.com/n/channel_devcenter/img/flexsnapshot/clip/clip6.jpg", size: :full, aspectMode: :cover, aspectRatio: "150:98", gravity: :center
        end

        horizontal_box backgroundColor: "#EC3D44", paddingAll: "2px", paddingStart: "4px", paddingEnd: "4px", flex: 0,
        position: :absolute, offsetStart: "18px", offsetTop: "18px", cornerRadius: "100px", width: "48px", height: "25px" do
          text "NEW", size: :xs, color: "#ffffff", align: :center, gravity: :center
        end
      end
    end

    body paddingAll: "20px", backgroundColor: "#464F69" do
      vertical_box spacing: "sm" do
        text "Cony Residence", size: :xl, wrap: true, color: "#ffffff", weight: :bold
        text "3 Bedrooms, ¥35,000", color: "#ffffffcc", size: :sm
      end

      vertical_box paddingAll: "13px", backgroundColor: "#ffffff1A", cornerRadius: "2px", margin: :xl do
        vertical_box do
          text "Private Pool, Delivery box, Floor heating, Private Cinema", size: :sm, wrap: true, margin: :lg, color: "#ffffffde"
        end
      end
    end
  end
end

puts json
Clipboard.copy json
