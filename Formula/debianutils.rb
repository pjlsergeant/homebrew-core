class Debianutils < Formula
  homepage "http://anonscm.debian.org/gitweb/?p=users/clint/debianutils.git"
  url "http://ftp.de.debian.org/debian/pool/main/d/debianutils/debianutils_4.4.tar.gz"
  sha1 "019b969ab698c83117254b50fc8f469f10a5d8d6"

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make"

    # some commands are Debian Linux specific and we don't want them, so install specific tools
    bin.install "run-parts", "ischroot", "tempfile"
    man1.install "ischroot.1", "tempfile.1"
    man8.install "run-parts.8"
  end

  test do
    assert File.exist?(shell_output("#{bin}/tempfile -d #{Dir.pwd}").strip)
  end
end
