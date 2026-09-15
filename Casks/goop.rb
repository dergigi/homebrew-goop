cask "goop" do
  arch arm: "arm64", intel: "x64"

  version "2.8.0"
  sha256 arm:   "abc594cadc6f2570914370d9b0469a5c3a410190fb37cc5b832ea0e25b340429",
         intel: "20948cee4e1c99c2dc4f0bbb649b489772c9fff45ccbd977fe076fba2b9bce32"

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
