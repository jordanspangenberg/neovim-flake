{ lib, ... }:
with lib; let
  mkEnable = desc:
    mkOption {
      description = "Turn on ${desc} for enabled languages by default";
      type = types.bool;
      default = false;
    };
in
{
  imports = [
    ./bash.nix
    ./clang.nix
    ./go.nix
    ./html.nix
    ./markdown.nix
    ./nix.nix
    ./plantuml.nix
    ./python.nix
    ./rust.nix
    ./sclang.nix
    ./terraform.nix
    ./tidal.nix
    ./ts.nix
  ];

  options.vim.languages = {
    enableLSP = mkEnable "LSP";
    enableTreesitter = mkEnable "treesitter";
    enableFormat = mkEnable "formatting";
    enableExtraDiagnostics = mkEnable "extra diagnostics";
    enableDebugger = mkEnable "debuggers";
  };
}
