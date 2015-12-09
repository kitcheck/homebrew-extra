require "formula"

class Wkhtmltox < Formula
  homepage "http://wkhtmltopdf.org"

  url "http://download.gna.org/wkhtmltopdf/0.12/0.12.2/wkhtmltox-0.12.2_osx-cocoa-x86-64.pkg"
  version "0.12.2.2"
  sha1 "26eb2cd7d678f715b542029273651766a27fbb31"

  depends_on "xz" => :build

  def install
    system "cat Payload | gunzip -dc | cpio -i"
    system "xz -d usr/local/share/wkhtmltox-installer/app.tar.xz"
    system "tar -xf usr/local/share/wkhtmltox-installer/app.tar"

    bin.install Dir['bin/*']
    lib.install Dir['lib/*']
    include.install Dir['include/*']
    man1.install Dir['share/man/man1/*']
  end
end
