{
  enable = true;
  shellAliases = {
    download = "youtube-dl -f bestaudio -x --embed-thumbnail --add-metadata";
    cp = "cp -i";
    df = "df -H";
    path = "echo -e ${PATH//:/\\n}";
    today = "date +%d-%m-%Y";
  };
}
