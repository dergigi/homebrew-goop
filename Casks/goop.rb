cask "goop" do
  arch arm: "arm64", intel: "x64"

  version "2.12.0"
  sha256 arm:   "26a779c20fc0b51cc673f73dfc97fc44eecc8317f2e508ae4298cf9a9be4ceeb",
         intel: "77988c23a561c52664cfd963d443ec04ee9f1f403206fc465b07bae364ef75c6"

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
