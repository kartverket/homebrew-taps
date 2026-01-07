class Openfyba < Formula
  desc "OpenFYBA: library for reading/writing Norwegian SOSI geodata format"
  homepage "https://github.com/kartverket/fyba"

  url "https://github.com/kartverket/fyba/archive/b00ae60436bd24145df7006a211219f5fdef6011.tar.gz"
  sha256 "e8649a073264195ed5ecbf2c6f2e84325667ff3c83e1bbd938d070ede43d636b"
  license "MIT"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "m4" => :build
  depends_on "pkg-config" => :build

  def install
    system "autoreconf", "--force", "--install"

    system "./configure",
           "--disable-dependency-tracking",
           "--disable-silent-rules",
           "--prefix=#{prefix}",
           "--enable-shared",
           "--disable-static"

    system "make"
    system "make", "install"
  end
end
