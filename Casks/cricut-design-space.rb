cask "cricut-design-space" do
  version "9.54.64"
  sha256 "b266d99126d005622eb636ad80387306b706723374a52b801963fce83ff72ef3"

  url "https://apis.cricut.com/desktopdownload/InstallerFile?fileName=CricutDesignSpace-Install-v#{version}.dmg&operatingSystem=osxnative" do |url|
    require "json"
    require "open-uri"
    json_data = JSON.parse(URI.open(url).read)
    json_data["result"]
  end
  name "Cricut Design Space"
  desc "Proprietary vinyl CNC software suite"
  homepage "https://design.cricut.com/"

  app "Cricut Design Space.app"

  auto_updates true
end
