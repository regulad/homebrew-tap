cask "perplexity" do
  version ":latest"
  sha256 ":no_check"

  # not currently working; what kind of AI-slop fueled idiot forgets
  # to turn off cloudflare protection on their *dedicated CDN domain??*
  url "https://macos-download.perplexity.ai/Perplexity.dmg"
  name "Perplexity"
  desc "Perplexity app for macOS"
  homepage "https://www.perplexity.ai"

  depends_on macos: ">= :sequoia"

  app "Perplexity.dmg"

  zap trash: [
       "~/.perplexity-local-browser.sock",
       "~/Library/Application Scripts/7S8W4W365S.ai.perplexity.macv3.shared",
       "~/Library/Application Scripts/group.ai.perplexity.app",
       "~/Library/Application Support/ai.perplexity.macv3*",
       "~/Library/Caches/ai.perplexity.macv3*",
       "~/Library/Group Containers/7S8W4W365S.ai.perplexity.macv3.shared",
       "~/Library/Group Containers/group.ai.perplexity.app",
       "~/Library/HTTPStorages/ai.perplexity.macv3*",
       "~/Library/Preferences/ai.perplexity.macv3.perplexityd.plist",
       "~/Library/Preferences/ai.perplexity.macv3.plist",
       "~/Library/WebKit/ai.perplexity.macv3",
     ]
end
