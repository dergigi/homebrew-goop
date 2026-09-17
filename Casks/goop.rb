cask "goop" do
  arch arm: "arm64", intel: "x64"

  version "2.11.0"
  sha256 arm:   "2c4dcd517690346fa69b2d85d4129b0e65fd2693fcbb867e9d9151ccd23ed7f2",
         intel: "5a10b709222049bd5f3a65191303b59fd7e8241dd78342f83a818c07af8e9d1c"

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
