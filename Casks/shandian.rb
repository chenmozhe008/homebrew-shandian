cask "shandian" do
  arch arm: "AppleSilicon", intel: "Intel"

  version "0.20.6"
  sha256 arm:   "c5d95c5a22fefc5802674bc724f2439ff03db3d84cc85fd44b7f731704f5342e",
         intel: "e6db992b0b9bab3d44d748019a819c64b86d39d005816f168e2bc58d443394cb"

  url "https://github.com/chenmozhe008/shandian-download/releases/download/v#{version}/Shandian-#{version}-#{arch}.zip"
  name "闪电全能下载"
  name "Shandian Download Manager"
  desc "Native download manager that switches routes when a task is stuck at 0%"
  homepage "https://github.com/chenmozhe008/shandian-download"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :sonoma"

  app "闪电全能下载.app"

  # 应用未经 Apple 公证，用 Homebrew 安装时去掉隔离标记，打开时不再被系统拦下
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/闪电全能下载.app"]
  end

  zap trash: [
    "~/Library/Application Support/ShandianDownload",
    "~/Library/Preferences/io.github.chenmozhe008.shandian.plist",
  ]
end
