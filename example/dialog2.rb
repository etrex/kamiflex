require_relative '../lib/kamiflex'
require 'clipboard'

@body_url = "https://i.imgur.com/zUttWD1.png"

def border(color)
  {
    borderColor: color,
    borderWidth: :light
  }
end

def green_box(options = {})
  horizontal_box **border("#00FF00").merge(options) do
    yield if block_given?
  end
end

def blue_box(options = {})
  horizontal_box **border("#0000FF").merge(options) do
    yield if block_given?
  end
end

def blue_vertical_box(options = {})
  vertical_box **border("#0000FF").merge(options) do
    yield if block_given?
  end
end

def dialog_box(message)
  vertical_box do
    image @body_url, size: :full, aspectRatio: "100:50"
    horizontal_box paddingAll: "5px" do
      horizontal_box borderColor: "#000000", borderWidth: "semi-bold",
        backgroundColor: "#876444",
        cornerRadius: :xl,
        paddingAll: "2px" do
        horizontal_box borderColor: "#d1baa5", borderWidth: "semi-bold",
            backgroundColor: "#f7edc8",
            cornerRadius: :lg,
            paddingAll: "15px" do
          text message, wrap: true, size: :xs
        end
      end
    end
  end
end

def avatar_image_box(url)
  vertical_box position: :absolute,
    offsetStart: "60%", width: "50%",
    offsetTop: "0px" do
    image @body_url, size: :full, aspectRatio: "50:25"
    image url, size: :full, aspectRatio: "2:1"
  end
end

def avatar_name_box(name)
  # 陰影
  vertical_box position: :absolute,
        offsetStart: "60%", width: "50%",
        offsetTop: "10px" do
    image @body_url, size: :full, aspectRatio: "50:45"
    horizontal_box height: "30px", backgroundColor: "#00000066", cornerRadius: :xl do
    end
  end
  # 文字
  vertical_box position: :absolute,
        offsetStart: "60%", width: "50%",
        offsetTop: "5px" do
    image @body_url, size: :full, aspectRatio: "50:45"
    horizontal_box height: "30px", borderColor: "#f7edc8", borderWidth: "medium", backgroundColor: "#876444", cornerRadius: :xl do
      text name, size: :xs, color: "#FFFFFF", weight: :bold, align: :center, gravity: :center
    end
  end
end

text_message = "在 卡米哥 的「 深入 Flex Message - 以對話遊戲為例 」主題中，將會分享：使用 Flex Message 時的實作細節，包含遊戲風格的對話框介面、特殊樣式的按鈕、隱藏式的感應區、跨裝置的排版等。也會說明在設計一個新的 Flex Message 版型時，所採用的開發流程。"
url = "https://i.imgur.com/WWbqH9A.png"
kamigo_url = "https://www.kamigo.tw/assets/kamigo-c3b10dff4cdb60fa447496b22edad6c32fffde96de20262efba690892e4461e8.png"
bg_url = "https://1.bp.blogspot.com/-IRrkMk_r1_c/XJB6NdPZATI/AAAAAAABSAg/zJxTXh-zSIAHpcq8vIrsnzlhTnUVc9h1ACLcBGAs/s800/bg_kamogawa.jpg"
body_url = "https://i.imgur.com/zUttWD1.png"

json = Kamiflex.json(self) do
  alt_text "hello world!"
  bubble size: :giga do
    body paddingAll: "0px", backgroundColor: "#333333" do
      image body_url, size: :full, aspectRatio: "100:62", position: :absolute
      # 背景
      image bg_url, size: :full, position: :absolute, aspectRatio: "800:450"
      # 對話框
      dialog_box text_message
      # 角色圖
      avatar_image_box kamigo_url
      # 角色名稱
      avatar_name_box "卡米狗"
    end
  end
end

puts json
Clipboard.copy json