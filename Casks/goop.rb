cask "goop" do
  arch arm: "arm64", intel: "x64"

  version "2.14.3"
  sha256 arm:   "79554f12c6591fb093910be58eb262a7d28ca7b9bdb563ca308cd91d92eced3e",
         intel: "fe9b80f6e7b384c28f663cc52140bc2be3d44aa58664f9eabffbe0629409fec8"

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
