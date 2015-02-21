require "language/haskell"

class Purescript < Formula
  include Language::Haskell::Cabal

  homepage "http://www.purescript.org"
  url "http://hackage.haskell.org/package/purescript-0.6.8/purescript-0.6.8.tar.gz"
  sha1 "70fd4d3109d61c34c8898a30d222c4b1ad8fd7a5"
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
