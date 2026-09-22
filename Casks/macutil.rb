cask "macutil" do
  version "0.1.0"
  sha256 "5473ba48884eebecc22c4e1b9d95d93171bbaa9d6209cdbc5b291716944da0db"

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
