cask "anomalous" do
  version "0.3.1"
  sha256 "e29e1827efa8ffb55cce9337ba3e5723f0ea260b7f7f8c2d89fe544dbb04b730"

  url "https://github.com/msitarzewski/anomalous-mac/releases/download/v#{version}/Anomalous-#{version}.dmg"
  name "Anomalous"
  desc "Menu-bar anomaly detector — Activity Monitor with a 'so what?' and 'now what?'"
  homepage "https://anomalous.bot/"

  # Apple Silicon + macOS 26 (Tahoe) or later — the on-device AI needs the
  # Neural Engine. (If `brew audit` doesn't know :tahoe on your machine yet,
  # bump the symbol to whatever Homebrew calls macOS 26.)
  depends_on arch:  :arm64
  depends_on macos: :tahoe

  app "Anomalous.app"

  uninstall quit: "bot.anomalous.sensor"

  zap trash: [
    "~/Library/Application Support/Anomalous",
    "~/Library/Preferences/bot.anomalous.sensor.plist",
  ]
end
