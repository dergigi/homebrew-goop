cask "goop" do
  arch arm: "arm64", intel: "x64"

  version "2.8.1"
  sha256 arm:   "71c162adde29404d096cf684e96603a4e8a8a58a73b03fc91d549ee2d080f16c",
         intel: "623bf774a108ecc944653943badfaab00acb265dbf0a91d024dfdea64ddcdbc5"

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
