cask "goop" do
  arch arm: "arm64", intel: "x64"

  version "2.14.1"
  sha256 arm:   "f895b0b255b7ccda105db9a89199e8ffdd9d0af55bfa6fa345174ef907f1e19e",
         intel: "e740a1301f2ad67d4b1094fba7134d201578351c55f0fed722e4c577fa91048b"

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
