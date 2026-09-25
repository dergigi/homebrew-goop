cask "goop" do
  arch arm: "arm64", intel: "x64"

  version "2.14.0"
  sha256 arm:   "dd526639561ad0abbea533d70edd2180126c11bb114ffa7a86a820cae14202ff",
         intel: "de74b1360ab8bf255d3b12683938dbfa5050cd33502a232ed51d83413fa9b151"

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
