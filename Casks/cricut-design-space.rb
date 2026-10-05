cask "cricut-design-space" do
  version "9.54.64"
  sha256 "b266d99126d005622eb636ad80387306b706723374a52b801963fce83ff72ef3"

  # The download is a short-lived signed URL that Cricut's API hands out (the unsigned
  # URL is 403), so it is resolved when the cask loads. The "shard" component picks the
  # right CDN. Fetched with Homebrew's curl rather than open-uri: Homebrew's Ruby
  # does not always find a CA bundle, which broke installs with "certificate verify failed".
  # https://github.com/orgs/Homebrew/discussions/5879
  installer_api = "https://apis.cricut.com/desktopdownload/InstallerFile?fileName=CricutDesignSpace-Install-v#{version}.dmg&operatingSystem=osxnative&shard=a"
  installer = ::Utils::Curl.curl_output("--fail", "--location", installer_api).tap(&:assert_success!)
  url JSON.parse(installer.stdout)["result"]
  name "Cricut Design Space"
  desc "Proprietary vinyl CNC software suite"
  homepage "https://design.cricut.com/"

  auto_updates true
  # https://help.cricut.com/hc/en-us/articles/360009556033-System-Requirements-Design-Space
  depends_on macos: :monterey

  app "Cricut Design Space.app"
end
