class ZeroEyes < Formula
  desc "Read AI coding agent answers aloud on macOS"
  homepage "https://github.com/pawantekchandani/zero-eyes"
  url "https://github.com/pawantekchandani/zero-eyes/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "b6105bb8c7838f755ce5f89737ad93fc16d373f5b76f9e09f87da5407d8b043f"
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
