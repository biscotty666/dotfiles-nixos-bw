{ lib, pkgs }:

let
  python = pkgs.python310;

  myvscode = pkgs.vscode-with-extensions.override {
    vscodeExtensions = with pkgs.vscode-extensions; [
      ms-python.python
      batisteo.vscode-django
    ];
  };

  pythonRunPackages = with python.pkgs;[
    python
    django
  ];

  pythonDevPackages = with python.pkgs;[
    black
    flake8
    pylint
    setuptools
  ] ++ pythonRunPackages;

  venv = python.withPackages (ps: pythonDevPackages);
in
{
  inherit python pythonRunPackages pythonDevPackages venv;

  shell = pkgs.mkShell {
    buildInputs = pythonDevPackages ++ [ myvscode ];
    shellHook = "code .";
  };
}
