require 'kamiflex'

options = {
  position: :absolute,
  width: "37.5px",
  height: "37.5px",
}

colors = [
  "#333333",
  "#cccccc",
]

hash = Kamiflex.hash(self) do
  alt_text "黑白棋盤"
  carousel do
    bubbles 2.times, size: :mega do
      body paddingAll: "0px", height: "300px" do
        8.times do |x|
          8.times do |y|
            color = colors[(x+y) % 2]
            horizontal_box **options, offsetTop: "#{x*37.5}px", offsetStart: "#{y*37.5}px", backgroundColor: color do
            end
          end
        end
      end
    end
  end
end

puts hash.to_json