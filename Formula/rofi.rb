class Rofi < Formula
  desc "Rofi: A window switcher, application launcher and dmenu replacement"
  homepage ""
  url "https://github.com/davatorium/rofi/releases/download/1.5.4/rofi-1.5.4.tar.gz"
  sha256 "67421ab8ff5fae50af3aa166e46664d1fc271168a2ea502dd56717583f3821bc"

  depends_on "flex" => :build
  depends_on "check" => :build
  depends_on "pango"
  depends_on "cairo"
  depends_on "glib"
  depends_on "librsvg"
  depends_on "startup-notification"
  depends_on "libxkbcommon"
  depends_on "libxcb"
  depends_on "xcb-util"
  depends_on "xcb-util-wm"
  depends_on "xcb-util-xrm"

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-syntax",
                          "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end
end
