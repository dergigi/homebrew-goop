cask "goop" do
  arch arm: "arm64", intel: "x64"

  version "2.15.0"
  sha256 arm:   "ae9f2585a2752f911e6c8bd22e8375e4272b7cbff1420403a4332b8e7b53e839",
         intel: "6d23e17bacb0d7951c1107fc3b2b54f01742c0d3130702a8dbe2bec023c6ecd1"

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
