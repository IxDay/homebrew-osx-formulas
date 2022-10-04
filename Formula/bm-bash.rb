class BmBash < Formula
  desc "This package provide a collection of bash utility functions we can re-use in BackMarket scripting"
  homepage "https://github.com/BackMarket/Formulas"
  version "v0.1.0-beta"

  url "git@github.com:BackMarket/bm-bash.git" , tag: "v0.1.0-beta", :using => :git
  license "MIT"

  on_macos do
    depends_on "linux-on-mac"
  end

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  def caveats
    <<~EOS
      You can add those utilities to your bash scripts by writing:
        `source $(bm-bash)` or `. $(bm-bash)`
    EOS
  end

  test do
    system "true"
  end
end
