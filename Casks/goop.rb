cask "goop" do
  arch arm: "arm64", intel: "x64"

  version "2.15.3"
  sha256 arm:   "617a4a64244bbf361a18e2ae9bb75f02a7cad375f3be45162dfd0ccea9a27a47",
         intel: "7e6355b19563b8f36beabad71725c45efc1b6af3fe6fe8a0b1a4523643080223"

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
