cask "goop" do
  arch arm: "arm64", intel: "x64"

  version "2.13.0"
  sha256 arm:   "360150fea42574b9fc81301d2754b577ece9273819e8c5e24521498bf03069c3",
         intel: "663b34c1bdafb6b93fa8280c31575d117ca27fc2ce511c69649b2c85f6433215"

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
