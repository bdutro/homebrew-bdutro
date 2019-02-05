# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class I3 < Formula
  desc "Tiling window manager"
  homepage "https://i3wm.org/"
  url "https://i3wm.org/downloads/i3-4.16.1.tar.bz2"
  sha256 "ab65c25c06acbdc67cba3ff23e2a82ea17911def65f4fd0200bb6f9382378576"
  head "https://github.com/i3/i3.git"

  depends_on "asciidoc" => :build
  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build
  depends_on "xmlto" => :build
  depends_on "xorg"
  depends_on "cairo"
  depends_on "gettext"
  depends_on "libev"
  depends_on "pango"
  depends_on "pcre"
  depends_on "startup-notification"
  depends_on "yajl"
  depends_on "libxkbcommon"
  depends_on "xcb-util-cursor"
  depends_on "xcb-util-wm"
  depends_on "xcb-util-keysyms"
  depends_on "xcb-util-xrm"

  def install
    system "autoreconf", "-fiv"
    system "./configure", "--prefix=#{prefix}"

    #cd "x86_64-pc-linux-gnu#{`uname -r`.chomp}" do
    cd "x86_64-pc-linux-gnu" do
      system "make", "install" #, "LDFLAGS=-liconv"
    end
  end

  test do
    result = shell_output("#{bin}/i3 -v")
    result.force_encoding("UTF-8") if result.respond_to?(:force_encoding)
    assert_match version.to_s, result
  end
end
