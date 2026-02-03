cask "cricut-design-space" do
  version "9.54.64"
  sha256 "b266d99126d005622eb636ad80387306b706723374a52b801963fce83ff72ef3"
  
  # https://github.com/orgs/Homebrew/discussions/5879
  def construct_url
    require "json"
    require "open-uri"
    # url needs the "shard" component to get the right CDN
    json_data = JSON.parse(URI.open("https://apis.cricut.com/desktopdownload/InstallerFile?fileName=CricutDesignSpace-Install-v#{version}.dmg&operatingSystem=osxnative&shard=a").read)
    json_data["result"]
  end

  url construct_url
  name "Cricut Design Space"
  desc "Proprietary vinyl CNC software suite"
  homepage "https://design.cricut.com/"

  app "Cricut Design Space.app"

  auto_updates true
end
