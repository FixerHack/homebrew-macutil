cask "macutil" do
  version "0.1.0"
  sha256 "62629878c93aa5451e98cd4b086c29214a3c81d12caeb2056b57ea9492f3f54d"

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
