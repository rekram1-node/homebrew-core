class Opencode < Formula
  desc "AI coding agent, built for the terminal"
  homepage "https://opencode.ai"
  version "1.0.107"
  license "MIT"

  on_macos do
    arch arm64: "arm64", intel: "x64"

    url "https://github.com/sst/opencode/releases/download/v#{version}/opencode-darwin-#{arch}.zip"
    sha256 arm64: "f0f45548537529e93344e884837779cb631a683ebe2507d774e9bd9e11fbf6a3",
           intel: "bfd697116a59f73ecda795509b24b91eef36102a36db1464cebd62c0b112d794"
  end

  on_linux do
    arch arm64: "arm64", intel: "x64"

    url "https://github.com/sst/opencode/releases/download/v#{version}/opencode-linux-#{arch}.tar.gz"
    sha256 arm64: "b052bc23a2b209b49ef5ff021d84587cdb7bdafc4718133d3d13635fc490c337",
           intel: "d8ac0d8b963e2f9e6e1142079b174a232741676d6492f86109c08700a825450d"
  end

  def install
    chmod "+x", "opencode"
    bin.install "opencode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opencode --version")
    assert_match "opencode", shell_output("#{bin}/opencode models")
  end
end
