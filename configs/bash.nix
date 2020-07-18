{
  enable = true;
  shellAliases = {
    download = "youtube-dl -f bestaudio -x ";
    cp = "cp -i";
    df = "df -H";
    today = "date +%d-%m-%Y";
  };
  sessionVariables = {
    TERM = "xterm-256color";
  };
}
