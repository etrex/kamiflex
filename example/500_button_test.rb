require 'kamiflex'

hash = Kamiflex.hash(self) do
  alt_text "500個按鈕測試"
  carousel do
    bubbles size: :giga do
      body paddingAll: "0px" do
        horizontal_box 125.times do |i|
          4.times do |j|
            url_button "#{i*4+j+1}", "https://kamigo.tw"
          end
        end
      end
    end
  end
end

puts hash.to_json