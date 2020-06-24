{ pkgs, config, options, lib, ... }:

with lib; with types; {
  options.modules.dev = {
    racket.enable = mkOption { type = types.bool; default = false; };
    heroku.enable = mkOption { type = types.bool; default = false; };
    clang.enable = mkOption { type = types.bool; default = false; };
    gcc.enable = mkOption { type = types.bool; default = false; };
  };

  config.my.packages = with pkgs; [
    (mkIf config.modules.dev.racket.enable racket) 
    (mkIf config.modules.dev.heroku.enable heroku) 
    (mkIf config.modules.dev.heroku.enable clang) 
    (mkIf config.modules.dev.clang.enable clang) 
    (mkIf config.modules.dev.gcc.enable gcc) 
  ];
}
