#
# ATTENTION: This is an autogenerated file. See original at
#            https://github.com/maplibre/martin/blob/main/.github/templates/homebrew.martin.rb.j2
#

class Martin < Formula
  current_version="0.9.4"

  desc "Blazing fast and lightweight tile server with PostGIS, MBTiles, and PMTiles support, plus an mbtiles tool"
  homepage "https://github.com/maplibre/martin"

  on_macos do
    on_arm do
      sha256 "TEST_macos_arm_sha256}"
      url "https://github.com/maplibre/martin/releases/download/v#{current_version}/martin-Darwin-aarch64.tar.gz"
    end
    on_intel do
      sha256 "TEST_macos_intel_sha256"
      url "https://github.com/maplibre/martin/releases/download/v#{current_version}/martin-Darwin-x86_64.tar.gz"
    end
  end

  on_linux do
    on_arm do
      sha256 "TEST_linux_arm_sha256"
      url "https://github.com/maplibre/martin/releases/download/v#{current_version}/martin-Linux-aarch64-musl.tar.gz"
    end
    on_intel do
      sha256 "TEST_linux_intel_sha256"
      url "https://github.com/maplibre/martin/releases/download/v#{current_version}/martin-Linux-x86_64-musl.tar.gz"
    end
  end

  version "#{current_version}"

  def install
    bin.install "martin"
    bin.install "mbtiles"
  end

  def caveats; <<~EOS
    Martin requires a database connection string.
    It can be passed as a command-line argument or as a DATABASE_URL environment variable.
      martin postgres://postgres@localhost/db
  EOS
  end

  test do
    `#{bin}/martin --version`
    `#{bin}/mbtiles --version`
  end
end
