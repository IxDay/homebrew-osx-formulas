class LinuxOnMac < Formula
  desc "This package provide a simple bin directory with all the linux utilities"
  homepage "https://github.com/BackMarket/Formulas"
  version "0.1.0"
  # https://apple.stackexchange.com/questions/243879/homebrew-recipe-without-url
  url "file:///dev/null"
  sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  license "MIT"

  depends_on "coreutils"
  depends_on "findutils"
  depends_on "gnu-indent"
  depends_on "gnu-getopt"
  depends_on "gnu-tar"
  depends_on "gnu-sed"
  depends_on "grep"
  depends_on "gawk"

  def install
    ["coreutils", "findutils", "gnu-indent", "gnu-tar", "gnu-sed", "grep", "gawk"].each { |dependency|
      (libexec/"gnubin").install_symlink (Formula[dependency].opt_libexec/"gnubin").children() 
    }
    # getopt does not use the "gnubin" directory, we are linking directly
    (libexec/"gnubin").install_symlink (Formula["gnu-getopt"].bin).children() 
  end

  def caveats
    <<~EOS
      All the linux commands have been installed in "#{opt_libexec}/gnubin".
      You can add this directory to your path in order to use linux scripts.
      We recommend the usage of `direnv` to load the proper path in dedicated directories:
       [ "$(uname)" = "Darwin" ] && PATH_add $(brew --prefix)/opt/linux-on-mac/libexec/gnubin
    EOS
  end

  test do
    system "true"
  end
end
