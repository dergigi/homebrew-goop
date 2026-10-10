cask "goop" do
  arch arm: "arm64", intel: "x64"

  version "2.15.1"
  sha256 arm:   "aa088897796d830241c687cedebf2123abc1977141232099d4d090b8a0abb9d4",
         intel: "7385cc1bac9400026fb8827bb85f58caf64833c803de82a325703781e6817910"

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
