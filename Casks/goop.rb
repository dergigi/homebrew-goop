cask "goop" do
  arch arm: "arm64", intel: "x64"

  version "2.11.2"
  sha256 arm:   "d92937553d2bbbd71b0a36db24dd26de0c109b4c912ee85a9f5d5a6c6b7e9103",
         intel: "bfc645016ac80c14b9e25c548e62e86a06f615020184fed664c7489934a929d8"

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
