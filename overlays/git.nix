self: super: {
  git = super.git.overrideAttrs (old: {
    version = "2.39.1";
    src = builtins.fetchurl {
      url = "https://www.kernel.org/pub/software/scm/git/git-2.39.1.tar.xz";
      sha256 = "sha256:0qf1wly7zagg23svpv533va5v213y7y3lfw76ldkf35k8w48m8s0";
    };
  });
}
