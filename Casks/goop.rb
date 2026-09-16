cask "goop" do
  arch arm: "arm64", intel: "x64"

  version "2.9.0"
  sha256 arm:   "d109ac4c07ab7cfc9e6f762d752cdb1bad148e2abe60fa4febe44180c2b77bc1",
         intel: "52a9005e4b14a7bee7c178ef4fe820b6d7093df7f6a587429c9c9ba566acef1d"

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
