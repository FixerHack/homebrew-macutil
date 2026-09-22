cask "macutil" do
  version "0.1.1"
  sha256 "0387bb863dd0098b4edc83fd9477c28c05ab6d63647ee8fa5330cd5e0f0da994"

  url "https://github.com/FixerHack/MacUtil/releases/download/v#{version}/MacUtil-#{version}.dmg"
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
    Open it once, then: System Settings → Privacy & Security → Open Anyway.
    Or run:
      xattr -dr com.apple.quarantine #{appdir}/MacUtil.app

    MacUtil не нотаризований Apple, тому macOS блокує перший запуск.
    Відкрийте його один раз, потім: Системні параметри → Приватність і безпека → Все одно відкрити.

    On first launch MacUtil shows how to grant Full Disk Access.
  EOS
end
