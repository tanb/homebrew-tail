class PipenvPipes < Formula
  include Language::Python::Virtualenv

  desc "A PipEnv Environment Switcher"
  homepage "https://pipenv-pipes.readthedocs.io"
  url "https://files.pythonhosted.org/packages/fd/88/af64f2f49c122357c1c83df1b12b98b0bd40c8da5d74977210e1ffe93e7e/pipenv_pipes-0.6.3.post3.tar.gz"
  sha256 "b1ab97c2484a87839560ce7e43b4b2accc05c6b08b94b1f974c1b72cdd73682c"

  depends_on "python"

  resource "colorama" do
    url "https://files.pythonhosted.org/packages/e6/76/257b53926889e2835355d74fec73d82662100135293e17d382e2b74d1669/colorama-0.3.9.tar.gz"
    sha256 "48eb22f4f8461b1df5734a074b57042430fb06e1d61bd1e11b078c0fe6d7a1f1"
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/95/d9/c3336b6b5711c3ab9d1d3a80f1a3e2afeb9d8c02a7166462f6cc96570897/click-6.7.tar.gz"
    sha256 "f15516df478d5a56180fbf80e68f206010e6d160fc39fa508b65e035fd75130b"
  end

  def install
    # Using the virtualenv DSL here because the alternative of using
    # write_env_script to set a PYTHONPATH breaks things.
    # https://github.com/Homebrew/homebrew-core/pull/19060#issuecomment-338397417
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install resources
    venv.pip_install buildpath

    # `pipes` needs to be able to find `colorama` and `click` on PATH. So we
    # install symlinks for those scripts in `#{libexec}/tools` and create a
    # wrapper script for `pipenv` which adds `#{libexec}/tools` to PATH.
    (libexec/"tools").install_symlink libexec/"bin/colorama", libexec/"bin/pipes", libexec/"bin/click"

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
