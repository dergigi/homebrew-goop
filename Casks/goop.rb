cask "goop" do
  arch arm: "arm64", intel: "x64"

  version "2.7.0"
  sha256 arm:   "cd667d5ab8d3e362710fa8326bd8851d5d9ca8c76967aa00dbaba6e10e2f4b63",
         intel: "ffa4ff3037eeb24b8f63e71cb11196138008f03caf4e2d4ce34cd6be24e9f6c0"

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
