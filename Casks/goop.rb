cask "goop" do
  arch arm: "arm64", intel: "x64"

  version "2.10.1"
  sha256 arm:   "aa0a5c5e575d47a70ae6bc9a9b52fedc3b76c052f8e8b887ef42fa299f7fd923",
         intel: "03147419c5b03f23ba9ef97d37dfe619aa784b7dce9d763adb70409929feb3d3"

  url "https://github.com/dergigi/goop/releases/download/v#{version}/goop-macos-#{arch}.dmg"
  name "Goop"
  desc "Encrypted Nostr direct and group messaging client"
  homepage "https://goop.dergigi.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :big_sur

  app "Goop.app"
end
