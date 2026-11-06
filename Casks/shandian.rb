cask "shandian" do
  arch arm: "AppleSilicon", intel: "Intel"

  version "0.19.11"
  sha256 arm:   "2d5a350c09e9387faf83d3256dfe016a33c51d79fe7b2ae80639c445cf35d1a9",
         intel: "6ede687fe92bc4e632b7881e5bd7970ec4f1f75d77b307578e864f41a9fb93d9"

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
