require 'formula'

class Credulous < Formula
  homepage 'https://github.com/realestate-com-au/credulous'
  version '0.2.1'
  url "https://github.com/realestate-com-au/credulous/releases/download/#{version}/credulous-#{version}.131-osx.tgz"
  sha256 '42ac207b8ef19509986d3a7eda3832f2466bf79ad3cbaa241986dc653e22daf9'

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
