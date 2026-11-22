cask "shandian" do
  arch arm: "AppleSilicon", intel: "Intel"

  version "0.21.2"
  sha256 arm:   "c386e2730610af6ca0a5b2489ab0a52cfe13c288ff75fe36144b67d545e9098f",
         intel: "8c2f498ede76a0cc6e178e99ccca1fb7bd134b50e33712925683a4f650428d32"

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
