class OtcAuth < Formula
  desc "Open Source CLI for the Open Telekom Cloud written in go"
  homepage "https://github.com/iits-consulting/otc-auth"
  url "https://github.com/iits-consulting/otc-auth.git",
      tag:      "v2.2.0",
     revision: "ca80a59ca32ee1af9aec2b8bd5bd450653669ee0"
  license "GPLv3"
  head "https://github.com/iits-consulting/otc-auth.git", branch: "main"
  depends_on "bash" => :build
  depends_on "coreutils" => :build
  depends_on "go" => :build
  uses_from_macos "rsync" => :build
  def install
    system "go", "build", "-ldflags", "-X main.version=#{version} -X main.date=#{Date.today}"
    bin.install "./otc-auth"
  end
  test do
    run_output = shell_output("#{bin}/otc-auth version 2>&1")
    assert run_output.start_with?("OTC-Auth #{version}")
  end
end
