class Neotags < Formula
  desc ""
  homepage ""
  head "https://github.com/c0r73x/neotags.nvim.git"
  depends_on "cmake" => :build
  depends_on "libbsd"
  depends_on "xz"

  patch :DATA

  def install
    system "make", "mkdir"

    Dir.chdir("neotags_bin/build")
    system "cmake", "-DCMAKE_BUILD_TYPE=Release", "-DUSE_LIBBSD=1", ".."
    Dir.chdir("../..")

    system "make", "-C", "neotags_bin/build"

    mkdir_p share/"neotags"

    (share/"neotags").install "doc"
    (share/"neotags").install "neotags_bin"
    (share/"neotags").install "plugin"
    (share/"neotags").install "rplugin"
    (share/"neotags").install "LICENSE"
    (share/"neotags").install "README.md"
  end
end

__END__
diff --git a/neotags_bin/src/strip.c b/neotags_bin/src/strip.c
index 99b7a1c..000e85d 100644
--- a/neotags_bin/src/strip.c
+++ b/neotags_bin/src/strip.c
@@ -75,7 +75,7 @@ strip_comments(struct String *buffer)
             slash = false;                             \
     } while (0)
 
-#define SLS(STR_) (STR_), (sizeof(STR_) - 1)
+#define STRNCMP(s1, s2) strncmp((s1), (s2), sizeof(s2) - 1)
 
 enum c_com_type { NONE, BLOCK, LINE };
 
@@ -154,7 +154,7 @@ handle_cstyle(struct String *vim_buf)
                                 const char *tmp = pos + 1;
                                 while (tmp < endln && isblank(*tmp))
                                         ++tmp;
-                                if (strncmp(tmp, SLS("include")) == 0) {
+                                if (STRNCMP(tmp, "include") == 0) {
                                         header = true;
                                         pos = endln - 1;
                                         continue;
