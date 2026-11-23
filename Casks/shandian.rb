cask "shandian" do
  arch arm: "AppleSilicon", intel: "Intel"

  version "0.22.2"
  sha256 arm:   "368766e474d98f51c5db92c2d7b6925541645bfdd43c02fed78fd28d341e1074",
         intel: "3dfdc523af556fd7d75b59c4094efa2fde7742bdea3dddc379c5b6003e38bc46"

  url "https://github.com/chenmozhe008/shandian-download/releases/download/v#{version}/Shandian-#{version}-#{arch}.zip"
  name "闪电全能下载"
  name "Shandian Download Manager"
  desc "Native macOS download manager with bulk media and Baidu Netdisk downloads"
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
