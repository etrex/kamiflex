require 'kamiflex'

options = {
  position: :absolute,
  width: "20px",
  height: "20px",
  backgroundColor: "#cccccc"
}

# size = "nano"
# size = "micro"
# size = "kilo"
# size = "mega"
size = "giga"

hash = Kamiflex.hash(self) do
  alt_text "Flex 尺寸測試"
  carousel do
    bubbles 2.times, size: size do
      body paddingAll: "0px", height: "500px" do
        text size, align: :center
        25.times do |i|
          horizontal_box **options, offsetTop: "#{i*20}px", offsetStart: "#{i*20}px" do
            text "#{i}", align: :center, gravity: :center
          end
        end
      end
    end
  end
end

puts hash.to_json