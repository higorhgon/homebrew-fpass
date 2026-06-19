class Fpass < Formula
  desc "Gerenciador de senhas com interface TUI para KeePassXC (.kdbx)"
  homepage "https://github.com/higorhgon/fpass"
  url "https://github.com/higorhgon/fpass/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "ef37b2a15404caae9de6081ca44235112c611daad4075d34a5938aa8725ab14c"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release", "--locked"
    bin.install "target/release/fpass"
    doc.install "README.md"
  end

  def caveats
    <<~EOS
      fpass requer o KeePassXC instalado para funcionar.
      Caso ainda não tenha, instale com:
        brew install --cask keepassxc
    EOS
  end

  test do
    system "#{bin}/fpass", "--version"
  end
end
