cask "goop" do
  arch arm: "arm64", intel: "x64"

  version "2.15.2"
  sha256 arm:   "b74f4576f7efc98dd8261f0f803d67733a9ea17475f68e8b66c5f1ae3aeec1bb",
         intel: "585c6e4cdfb258bb977975a05d95a8e03eb3d4878470470287633a49176a5a3e"

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
