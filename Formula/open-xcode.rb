class OpenXcode < Formula
  desc "Open the right Xcode workspace/project from anywhere in a repo"
  homepage "https://github.com/OwaisQuadri/open-xcode"
  url "https://github.com/OwaisQuadri/open-xcode/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "REPLACE_AFTER_TAGGING" # shasum -a 256 <v1.0.0 tarball>
  license "MIT"
  head "https://github.com/OwaisQuadri/open-xcode.git", branch: "main"

  def install
    bin.install "bin/open-xcode"
  end

  test do
    output = shell_output("#{bin}/open-xcode --print 2>&1", 1)
    assert_match "No .xcworkspace or .xcodeproj found", output
  end
end
