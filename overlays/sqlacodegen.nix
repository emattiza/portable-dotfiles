self: super: {
  sqlacodegen = super.pkgs.python3Packages.buildPythonApplication {
    pname = "sqlacodegen";
    version = "unstable-2023-10-20";
    format = "pyproject";
    nativeBuildInputs = [
      super.python3.pkgs.setuptools
      super.python3.pkgs.wheel
    ];
    buildInputs = [
      super.python3.pkgs.inflect
      super.python3.pkgs.importlib-metadata
      super.python3.pkgs.greenlet
    ];
    propagatedBuildInputs = [
      super.python3.pkgs.sqlalchemy
    ];
    src = super.fetchFromGitHub {
      owner = "agronholm";
      repo = "sqlacodegen";
      rev = "2c094bed6e87c832b9ff8996e283e0ad7b6faddc";
      sha256 = "sha256-sOBMQbpAG5XFS49C95lexEfB38XcCOKTEvktLo0OsXI=";
    };
  };
}
