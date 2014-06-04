require 'formula'

class Credulous < Formula
  homepage 'https://github.com/realestate-com-au/credulous'
  version '0.2.0'
  url "https://github.com/realestate-com-au/credulous/releases/download/#{version}/credulous-#{version}.104-osx.tgz"
  sha1 'aa232809883dee18021e8d4ab54fcd160f522fc7'

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
