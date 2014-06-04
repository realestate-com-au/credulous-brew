require 'formula'

class Credulous < Formula
  homepage 'https://github.com/realestate-com-au/credulous'
  version '0.2.0.104'
  url "https://github.com/realestate-com-au/credulous/releases/download/#{version}/credulous-#{version}-osx.tgz"
  sha1 'de5549a0a11360835ae1458fa589e1f0446ccd8b'

  def install
    bin.install "credulous"
    bash_completion.install "credulous.bash_completion" => "credulous"
    man1.mkpath
    man1.install "credulous.1"
  end

  test do
    assert_equal "Credulous version #{version}", `#{bin}/credulous -v`.strip
  end

end
