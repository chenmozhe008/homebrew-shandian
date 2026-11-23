cask "shandian" do
  arch arm: "AppleSilicon", intel: "Intel"

  version "0.22.6"
  sha256 arm:   "3b8cb3918b12dbdcfbdaac540c828872378e01708af4ad48b40c1fb1e9a52c5a",
         intel: "61fc8a6756f6c6f45b45f85390c51da0938c1d0fedbcf4afbb95090324915255"

  url "https://github.com/chenmozhe008/shandian-download/releases/download/v#{version}/Shandian-#{version}-#{arch}.zip"
  name "闪电全能下载"
  name "Shandian Download Manager"
  desc "Native macOS downloader for Feishu and Qingque Docs media, Baidu shares, and more"
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
