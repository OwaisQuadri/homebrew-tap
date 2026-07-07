class OpenXcode < Formula
  desc "Open the right Xcode workspace/project from anywhere in a repo"
  homepage "https://github.com/OwaisQuadri/open-xcode"
  url "https://github.com/OwaisQuadri/open-xcode/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "ebc6e3721b314eadffcb3cb93c53b068cc7846ad5404c21bf728506c29f78169"
  license "MIT"
  head "https://github.com/OwaisQuadri/open-xcode.git", branch: "main"

  def install
    bin.install "bin/open-xcode"
    pkgshare.install "claude"
  end

  def caveats
    <<~EOS
      To install the Claude Code skill and /open-xcode slash command:
        mkdir -p ~/.claude/skills/open-xcode ~/.claude/commands
        cp #{opt_pkgshare}/claude/skills/open-xcode/SKILL.md ~/.claude/skills/open-xcode/
        cp #{opt_pkgshare}/claude/commands/open-xcode.md ~/.claude/commands/
    EOS
  end

  test do
    output = shell_output("#{bin}/open-xcode --print 2>&1", 1)
    assert_match "No .xcworkspace or .xcodeproj found", output
  end
end
