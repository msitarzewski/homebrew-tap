cask "anomalous" do
  version "0.2.2"
  sha256 "9b0fa7135cee2eae17932dd438b7f1ed9c370211eab48638603cbcdaaa84b546"

  url "https://github.com/msitarzewski/anomalous-mac/releases/download/v#{version}/Anomalous-#{version}.dmg",
      verified: "github.com/msitarzewski/anomalous-mac/"
  name "Anomalous"
  desc "Menu-bar anomaly detector — Activity Monitor with a 'so what?' and 'now what?'"
  homepage "https://anomalous.bot/"

  # Apple Silicon + macOS 26 (Tahoe) or later — the on-device AI needs the
  # Neural Engine. (If `brew audit` doesn't know :tahoe on your machine yet,
  # bump the symbol to whatever Homebrew calls macOS 26.)
  depends_on arch:  :arm64
  depends_on macos: ">= :tahoe"

  app "Anomalous.app"

  uninstall quit: "bot.anomalous.sensor"

  zap trash: [
    "~/Library/Application Support/Anomalous",
    "~/Library/Preferences/bot.anomalous.sensor.plist",
  ]
end
