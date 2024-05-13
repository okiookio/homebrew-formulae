# typed: false
# frozen_string_literal: true

# :nodoc:
class Gyb < Formula
  desc "\"Generate Your Boilerplate\""
  homepage "https://nshipster.com/swift-gyb/"
  url "https://raw.githubusercontent.com/apple/swift/main/utils/gyb"
  version "2024-05-14"
  sha256 "5647355be7d91007cc4c849da79bea235a7d7f97871384f0d12f639402d53190"

  depends_on xcode: ["15.0", :build]

  resource "gyb.py" do
    url "https://raw.githubusercontent.com/apple/swift/main/utils/gyb.py"
    version "2024-05-14"
    sha256 "dbe94da7e6622b605fea6406aa3ab6e7f64202198f8f351bfe3dab618ae84304"
  end
  depends_on "python@2" if MacOS.version <= :snow_leopard

  def install
    resource("gyb.py").stage { bin.install "gyb.py" }
    bin.install "gyb"
    chmod 0755, bin/"gyb"
  end

  test do
    system bin/"gyb", "--help"
  end
end
