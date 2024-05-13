# typed: false
# frozen_string_literal: true

# :nodoc:
class Gyb < Formula
  desc "\"Generate Your Boilerplate\""
  homepage "https://nshipster.com/swift-gyb/"
  url "https://raw.githubusercontent.com/apple/swift/main/utils/gyb"
  version "2024-05-14"
  # sha256 "0a97b3ac257fa29d6240d1878590facd1d80053491cc14601f7e68bb182a29b1"

  depends_on xcode: ["15.0", :build]

  resource "gyb.py" do
    url "https://raw.githubusercontent.com/apple/swift/main/utils/gyb.py"
    version "2024-05-14"
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
