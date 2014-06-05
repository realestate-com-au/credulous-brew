require 'formula'

class Credulous < Formula
  homepage 'https://github.com/realestate-com-au/credulous'
  version '0.2.0'
  url "file:///tmp/credulous-0.2.0.104-osx.tgz"
  sha1 '5b522f3e0d845ff731cd1a1f1751fca4d5d4fbb8'

  def install
    bin.install "credulous"
    (etc/'profile.d').install "credulous.sh"
    bash_completion.install "credulous.bash_completion" => "credulous"
    man1.mkpath
    man1.install "credulous.1"
  end

  test do
    assert_equal "Credulous version #{version}", `#{bin}/credulous -v`.strip
  end

  def caveats; <<-EOS.undent
    Add the following lines to your ~/.bash_profile:
      if [ -f $(brew --prefix)/etc/profile.d/credulous.sh ]; then
        . $(brew --prefix)/etc/profile.d/credulous.sh
      fi
    EOS
  end

end
