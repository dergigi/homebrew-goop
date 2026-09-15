cask "goop" do
  arch arm: "arm64", intel: "x64"

  version "2.5.0"
  sha256 arm:   "cd49218f07fb2a4d9ca7ceac433fe577e154bf7b7ff3fa2c02ac64a7870340f5",
         intel: "1417143f91274ae38992e14a5a2a2c411df5461edfef2f4ff2a96619afa86b9a"

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
