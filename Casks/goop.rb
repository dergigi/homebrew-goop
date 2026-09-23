cask "goop" do
  arch arm: "arm64", intel: "x64"

  version "2.13.1"
  sha256 arm:   "ed99fdfb9c96ad7bc0ce2521fbeb143a981f6a606f9d194256e68fc51990cfc4",
         intel: "e066ecec103e2fe1fa83de84f939c33b3b99c310651ab602c4a85656a1f0ea36"

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
