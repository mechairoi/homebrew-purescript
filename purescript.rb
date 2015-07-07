require "language/haskell"

class Purescript < Formula
  include Language::Haskell::Cabal

  homepage "http://www.purescript.org"
  url "https://hackage.haskell.org/package/purescript-0.7.0.0/purescript-0.7.0.0.tar.gz"
  sha1 "83f4dfc520afd25576031256e9ca3c775e6eba52"
  head "https://github.com/purescript/purescript", :using => :git

  depends_on "ghc" => :build
  depends_on "cabal-install" => :build
  depends_on "gmp"

  def install
    cabal_sandbox do
      cabal_install "--only-dependencies"
      cabal_install "--prefix=#{prefix}"
    end
    cabal_clean_lib
  end

  test do
    system "psc"
  end
end
