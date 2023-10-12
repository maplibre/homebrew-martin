class Martin < Formula
  current_version="0.9.2"

  desc "Blazing fast and lightweight tile server with PostGIS, MBTiles, and PMTiles support, plus an mbtiles tool"
  homepage "https://github.com/maplibre/martin"

  on_macos do
    on_arm do
      sha256 "419d2c08ce57485b3ba6b8ad601462f4de8d92112be94aae13e547e97ae2bee8"
      url "https://github.com/maplibre/martin/releases/download/v#{current_version}/martin-Darwin-aarch64.tar.gz"
    end
    on_intel do
      sha256 "308bd76498724a91da40324d4836260a2065ade174124d92013ff073da356531"
      url "https://github.com/maplibre/martin/releases/download/v#{current_version}/martin-Darwin-x86_64.tar.gz"
    end
  end

  on_linux do
    on_arm do
      sha256 "605e45cfb0c3a402237a8858625c0ba8d4c336bca7caeb06205e619467088b3f"
      url "https://github.com/maplibre/martin/releases/download/v#{current_version}/martin-Linux-aarch64-musl.tar.gz"
    end
    on_intel do
      sha256 "fb6c26af1c5c3cc87416edf0e9013fc8aa1c74f543276f94523c8a38a643f3d7"
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
