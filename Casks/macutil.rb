cask "macutil" do
  version "0.1.0"
  sha256 "a8b54a4b96f3f7e1b9baa0b08f8e67b745ad4a7d3b9ddc2d2c5fec4646d7951e"

  url "https://github.com/FixerHack/MacUtil/releases/download/v#{version}/MacUtil-#{version}.zip"
  name "MacUtil"
  desc "Cleaner, optimizer and security analyzer"
  homepage "https://github.com/FixerHack/MacUtil"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "MacUtil.app"

  zap trash: [
    "~/Library/Application Support/MacUtil",
    "~/Library/Caches/com.fixerhack.MacUtil",
    "~/Library/HTTPStorages/com.fixerhack.MacUtil",
    "~/Library/HTTPStorages/com.fixerhack.MacUtil.binarycookies",
    "~/Library/Logs/MacUtil",
    "~/Library/Preferences/com.fixerhack.MacUtil.plist",
  ]

  caveats <<~EOS
    MacUtil is not notarized by Apple, so macOS blocks the first launch.
    Open it once, then choose System Settings → Privacy & Security → Open Anyway.
    Or run:
      xattr -dr com.apple.quarantine /Applications/MacUtil.app

    On first launch MacUtil shows how to grant Full Disk Access.
  EOS
end
