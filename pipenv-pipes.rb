class PipenvPipes < Formula
  include Language::Python::Virtualenv

  desc "A PipEnv Environment Switcher"
  homepage "https://pipenv-pipes.readthedocs.io"
  url "https://files.pythonhosted.org/packages/fd/88/af64f2f49c122357c1c83df1b12b98b0bd40c8da5d74977210e1ffe93e7e/pipenv_pipes-0.6.3.post3.tar.gz"
  sha256 "b1ab97c2484a87839560ce7e43b4b2accc05c6b08b94b1f974c1b72cdd73682c"

  # bottle do
  #   cellar :any_skip_relocation
  #   sha256 "60f024907a279b61665ea6c64836beece62a72375cf3d217b8d52d4f67aa1d03" => :high_sierra
  #   sha256 "0085107a2010e3fce5feb9fcbd8feb555809a68458e9e1abdfc4662154632fff" => :sierra
  #   sha256 "6816de1c639ea62e6b1a3752373559f427de2f69dab7a2bedf13a6b25d7e7bc9" => :el_capitan
  # end

  depends_on "python"

  # resource "certifi" do
  #   url "https://files.pythonhosted.org/packages/4d/9c/46e950a6f4d6b4be571ddcae21e7bc846fcbb88f1de3eff0f6dd0a6be55d/certifi-2018.4.16.tar.gz"
  #   sha256 "13e698f54293db9f89122b0581843a782ad0934a4fe0172d2a980ba77fc61bb7"
  # end

  def install
    # Using the virtualenv DSL here because the alternative of using
    # write_env_script to set a PYTHONPATH breaks things.
    # https://github.com/Homebrew/homebrew-core/pull/19060#issuecomment-338397417
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install resources
    venv.pip_install buildpath

    # `pipenv` needs to be able to find `virtualenv` and `pewtwo` on PATH. So we
    # install symlinks for those scripts in `#{libexec}/tools` and create a
    # wrapper script for `pipenv` which adds `#{libexec}/tools` to PATH.
    (libexec/"tools").install_symlink libexec/"bin/pipes"

    env = {
      :PATH => "#{libexec}/tools:$PATH",
    }
    (bin/"pipes").write_env_script(libexec/"bin/pipes", env)
  end

  # Avoid relative paths
  def post_install
    lib_python_path = Pathname.glob(libexec/"lib/python*").first
    lib_python_path.each_child do |f|
      next unless f.symlink?
      realpath = f.realpath
      rm f
      ln_s realpath, f
    end
    inreplace lib_python_path/"orig-prefix.txt",
              Formula["python"].opt_prefix, Formula["python"].prefix.realpath
  end

  test do
    ENV["LC_ALL"] = "en_US.UTF-8"
    assert_match "Commands", shell_output("#{bin}/pipes")
  end
end
