cask "goop" do
  arch arm: "arm64", intel: "x64"

  version "2.6.0"
  sha256 arm:   "5dd33769d62a820b3289ac55150d544949e4ddee34bba04fe48999757c7ce507",
         intel: "d99de243bcb8c62a0f7af75d67f2fa2e96dc00ab5efc7639509bf3a030567a32"

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
