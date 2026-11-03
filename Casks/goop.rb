cask "goop" do
  arch arm: "arm64", intel: "x64"

  version "2.16.0"
  sha256 arm:   "eeeaaef97c4d21e65fba16a5773f3e880c248a22c3ad9d9b2e498670dab84af4",
         intel: "0df2460583334e63156006e20bd1493c188d9fe6ff7d099cc8c2e31b16d5768d"

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
