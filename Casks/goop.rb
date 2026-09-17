cask "goop" do
  arch arm: "arm64", intel: "x64"

  version "2.11.1"
  sha256 arm:   "786b89761e199ddc57a9b29a1ad8a94850a306bdd5e10ff47e7465ac3c96e80a",
         intel: "06587721db9af7235ec9b300e9bb371a7d8c0dd7d2477894b4d9b21dc9be0dbf"

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
