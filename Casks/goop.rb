cask "goop" do
  arch arm: "arm64", intel: "x64"

  version "2.7.1"
  sha256 arm:   "5cc62654cca4debc44442d9b5683a5b2d616e3eb25698f7f81103ae9a73b4ccb",
         intel: "06569c724cd7e79e5cb3288c5a2ea402d1f3bdc8a602394b3b4174d02cfa32fe"

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
