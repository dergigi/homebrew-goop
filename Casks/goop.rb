cask "goop" do
  arch arm: "arm64", intel: "x64"

  version "2.14.2"
  sha256 arm:   "84ff42f1905902b7e779f3b92907ab305538519fc7419fc03948c99e3f1a8014",
         intel: "d3f48cb6e39380849bf33aa5b6d14805926f942505f3db709876441b583a338a"

  url "https://github.com/dergigi/goop/releases/download/v#{version}/goop-macos-#{arch}.dmg"
  name "Goop"
  desc "Encrypted Nostr direct and group messaging client"
  homepage "https://goop.dergigi.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :big_sur

  app "Goop.app"
end
