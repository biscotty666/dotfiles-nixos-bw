{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    markdown-oxide
    ruff
    rPackages.lintr
    rPackages.languageserver
    typescript-language-server
    luaPackages.tree-sitter-cli
    nil
  ];

}
