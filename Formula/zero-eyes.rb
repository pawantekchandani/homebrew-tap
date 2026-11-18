class ZeroEyes < Formula
  desc "Read AI coding agent answers aloud on macOS"
  homepage "https://github.com/pawantekchandani/zero-eyes"
  url "https://github.com/pawantekchandani/zero-eyes/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "8becb2916c0844e070d572dfe648e6ef0adf9ac09092bc8dc0bf1e8f79941e04"
  license "MIT"

  depends_on :macos

  def install
    libexec.install Dir["*"]
    (bin/"zero-eyes-setup").write <<~EOS
      #!/bin/zsh
      exec "#{opt_libexec}/scripts/install.sh" "$@"
    EOS
  end

  def caveats
    <<~EOS
      Run this once, and again after each upgrade, to install the player,
      overlay, login agent and hooks for your user:
        zero-eyes-setup
    EOS
  end

  test do
    assert_path_exists libexec/"bin/zero-eyes"
    system "/usr/bin/python3", "-m", "py_compile", libexec/"bin/zero-eyes"
  end
end
