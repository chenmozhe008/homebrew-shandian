cask "shandian" do
  arch arm: "AppleSilicon", intel: "Intel"

  version "0.20.1"
  sha256 arm:   "f76088c1160201434362ba166423cc59c278bf5d419db037ca5a04b5b115b3ca",
         intel: "ebf6c132261650ca123982c7635b3185f2733907ea9170bef3733a03e8e1f26c"

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
