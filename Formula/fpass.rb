class Fpass < Formula
  desc "Gerenciador de senhas com interface TUI para KeePassXC (.kdbx)"
  homepage "https://github.com/higorhgon/fpass"
  url "https://github.com/higorhgon/fpass/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "SKIP"
  license "MIT"

  depends_on "rust" => :build
  depends_on "keepassxc"

  def install
    system "cargo", "build", "--release", "--locked"
    bin.install "target/release/fpass"
    doc.install "README.md"
  end

  def test
    system "#{bin}/fpass", "--version" rescue nil
  end
end
