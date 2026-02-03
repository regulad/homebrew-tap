cask "epson-et8500" do
  version :latest
  sha256 :no_check

  url "https://ftp.epson.com/drivers/ET8500_Lite_64NR_NA.dmg"
  name "Drivers and Utilities Combo Package Installer"
  desc "Software package for Epson ET-8500"
  homepage "https://epson.com/Support/Printers/All-In-Ones/ET-Series/Epson-ET-8500/s/SPT_C11CJ20201"
  
  # TODO: scope this cask to just the driver packages eventually (only really need to do if I ever get another EPSON printer)
  installer manual: "Epson Installer.app"
  uninstall pkgutil: [
    "com.epson.pkg.EpsonScan2.help",
    "com.epson.pkg.EpsonScan2.Utility",
    "com.epson.epsvcp",
    "com.epson.fpkg.ECPS1100.220",
    "com.epson.pkg.Ocr.SysIntel",
    "com.epson.fpkg.ECPS1013.220",
    "com.epson.pkg.EpsonScan2",
    "com.epson.pkg.EpsonPhotoPlus",
    "com.epson.pkg.EpsonScan2.twain",
    "com.epson.pkg.ijpdrv.et-8550series.w.Machine_106_and_later",
    "com.epson.pkg.ijpdrv.et-8550series.w.USBClassDriver_107_and_later",
    "com.epson.pkg.EPSONSoftwareUpdater",
    "com.epson.pkg.Ocr",
    "com.epson.pkg.ijpdrv.remoteprint.w.Machine_106_and_later",
    "com.epson.pkg.EpsonScan2.ica",
    "com.epson.pkg.EpsonScan2.standalone",
    "com.epson.pkg.ijpdrv.remoteprint.w.Module_110_and_later",
    "com.epson.pkg.ijpdrv.et-8550series.w.Module_110_and_later",
    "com.epson.pkg.ijpdrv.remoteprint.w.RemotePrintIOHelperLaunchAgentPlist",
  ]

  auto_updates true
  caveats do
    requires_rosetta  # only some components do, notably the self-updater
    reboot
  end
end
