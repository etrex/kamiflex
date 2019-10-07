require_relative '../lib/kamiflex'

json = Kamiflex.build(self) do
  bubble  do
    body do
      vertical_box do
        text "total 1 hour", color: "#b7b7b7", size: "xs"
        horizontal_box spacing: "lg", cornerRadius: "30px", margin: "xl" do
          text "20:30", color: "#b7b7b7", size: "sm", gravity: "center"
          vertical_box flex: 0 do
            filler
            vertical_box cornerRadius: "30px", height: "12px", width: "12px", borderColor: "#6486E3", borderWidth: "2px" do
              filler
            end
            filler
          end
          text "A station", size: "sm", gravity: "center", flex: 4
        end

        horizontal_box spacing: "lg", height: "64px" do
          baseline_box flex: 1 do 
            filler
          end
          vertical_box width: "12px" do
            horizontal_box flex: 1 do
              filler
              vertical_box width: "2px", backgroundColor: "#B7B7B7" do
                  filler
              end
              filler
            end
          end
          text "walk 1 hour", gravity: "center", flex: 4, size: "xs", color: "#8c8c8c"
        end
        horizontal_box spacing: "lg", cornerRadius: "30px" do
          text "21:30", color: "#b7b7b7", size: "sm", gravity: "center"
          vertical_box flex: 0 do
            filler
            vertical_box cornerRadius: "30px", height: "12px", width: "12px", borderColor: "#6486E3", borderWidth: "2px" do
              filler
            end
            filler
          end
          text "B station", size: "sm", gravity: "center", flex: 4
        end
      end
      
      
    end
  end
end

puts json
