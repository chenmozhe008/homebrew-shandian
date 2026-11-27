cask "shandian" do
  arch arm: "AppleSilicon", intel: "Intel"

  version "0.22.8"
  sha256 arm:   "aabd4d4a5c3f212c3d2270ef7049db0980a3b912180e545dafe83758a8fa967e",
         intel: "0e0c35e346f28d4a354360e89889cefd249a7849bf9002383e9702202ce06e28"

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
