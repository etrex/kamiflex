require "kamiflex"
json = Kamiflex.json(self) do
  bubble size: "mega" do
    header paddingAll: "20px", backgroundColor: "#0367D3", spacing: "md", height: "154px", paddingTop: "22px" do
      vertical_box do
        text "FROM", color: "#ffffff66", size: "sm"
        text "akihabara", color: "#ffffff", size: "xl", flex: 4, weight: "bold"
      end
      vertical_box do
        text "TO", color: "#ffffff66", size: "sm"
        text "Shinjuku", color: "#ffffff", size: "xl", flex: 4, weight: "bold"
      end
    end
    body do
      text "Total: 1 hour", color: "#b7b7b7", size: "xs"

      horizontal_box spacing: "lg", cornerRadius: "30px", margin: "xl" do
        text "20:30", size: "sm", gravity: "center"
        vertical_box flex: 0 do
          filler
          vertical_box cornerRadius: "30px", height: "12px", width: "12px", borderColor: "#EF454D", borderWidth: "2px" do
          end
          filler
        end
        text "Akihabara", gravity: "center", flex: 4, size: "sm"
      end

      horizontal_box spacing: "lg", height: "64px" do
        baseline_box do
          filler
        end
        vertical_box width: "12px" do
          horizontal_box flex: 1 do
            filler
            vertical_box width: "2px", backgroundColor: "#B7B7B7" do
            end
            filler
          end
        end
        text "Walk 4 min", gravity: "center", flex: 4, size: "xs", color: "#8c8c8c"
      end

      horizontal_box spacing: "lg", cornerRadius: "30px" do
        horizontal_box flex: 1 do
          text "20:34", gravity: "center", size: "sm"
        end
        vertical_box flex: 0 do
          filler
          vertical_box cornerRadius: "30px", width: "12px", height: "12px", borderWidth: "2px", borderColor: "#6486E3" do
          end
          filler
        end
        text "Ochanomizu", gravity: "center", flex: 4, size: "sm"
      end

      horizontal_box spacing: "lg", height: "64px" do
        baseline_box flex: 1 do
          filler
        end
        vertical_box width: "12px" do
          horizontal_box flex: 1 do
            filler
            vertical_box width: "2px", backgroundColor: "#6486E3" do
            end
            filler
          end
        end
        text "Metro 1hr", gravity: "center", flex: 4, size: "xs", color: "#8c8c8c"
      end
      
      horizontal_box spacing: "lg", cornerRadius: "30px" do
        text "20:40", gravity: "center", size: "sm"
        vertical_box flex: 0 do
          filler
          vertical_box cornerRadius: "30px", width: "12px", height: "12px", borderColor: "#6486E3", borderWidth: "2px" do
          end
          filler
        end
        text "Shinjuku", gravity: "center", flex: 4, size: "sm"
      end
    end
  end
end

puts json
