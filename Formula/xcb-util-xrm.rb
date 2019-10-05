class XcbUtilXrm < Formula
  desc "XCB utility functions for the X resource manager"
  homepage ""
  url "https://github.com/Airblader/xcb-util-xrm/releases/download/v1.3/xcb-util-xrm-1.3.tar.bz2"
  sha256 "301cf33701207ea8782d49f4cb6404abd8f2d64e16f242017fd720be7c900c85"
  depends_on "xcb-util" => :build

  def install
    args = %W[
      --prefix=#{prefix}
      --sysconfdir=#{etc}
      --localstatedir=#{var}
      --disable-dependency-tracking
      --disable-silent-rules
      --enable-static=#{build.with?("static") ? "yes" : "no"}
      --enable-devel-docs=#{build.with?("docs") ? "yes" : "no"}
      --with-doxygen=#{build.with?("docs") ? "yes" : "no"}
    ]

    system "./configure", *args
    system "make", "install"
  end
end
