cask "goop" do
  arch arm: "arm64", intel: "x64"

  version "2.10.0"
  sha256 arm:   "e73d681df90559241d63224f64d1549ccafe73213873bcced9cf66799c08427b",
         intel: "fe2de1586a669369db53bdc9ce3e9e1c7521ff228627efa9fb98a4b63f3aee77"

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
