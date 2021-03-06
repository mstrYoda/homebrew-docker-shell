require "language/go"

# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class DockerShell < Formula
  desc "A simple interactive prompt for docker"
  homepage "https://github.com/mstrYoda/docker-shell"
  url "https://github.com/mstrYoda/docker-shell/archive/v1.0.0.tar.gz"
  sha256 "8ab0f94f587d7ffad05d2f6bdb64d670e72a1cf41369221db29b5c3cd7dbe4ef"
  head "https://github.com/mstrYoda/docker-shell"

  depends_on "go" => :build

  def install

    ENV["GOPATH"] = buildpath
    bin_path = buildpath/"src/github.com/mstrYoda/docker-shell"
    bin_path.install Dir["*"]

    cd bin_path do
      system "go", "build", "-o", bin/"docker-shell", "."
    end
  end

  test do
    system "true"
  end
end
