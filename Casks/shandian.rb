cask "shandian" do
  arch arm: "AppleSilicon", intel: "Intel"

  version "0.19.7"
  sha256 arm:   "20f088eea220061495d0f6a33faa48b95aaf15b25a7da5a3919c984b069911dd",
         intel: "c10b4cab47e6960f5776ec370b292e8250de5288518f9aa4ae24173f97e4b46e"

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
