require 'kamiflex'

hash = Kamiflex.hash(self) do
  alt_text "APNG 動畫測試"
  carousel do
    bubbles size: :giga do
      body paddingAll: "0px" do
        image "https://i.imgur.com/l505I10.png", size: :full, aspectRatio: "476:280", animated: true
      end
    end
  end
end

puts hash.to_json