alias cd..="cd .."

# download a playlist of music on youtube, store as .mp3 file with youtube thumbnail as its cover art
## requires youtube-dl
alias youtube-music='youtube-dl -4 --ignore-errors --format bestaudio --extract-audio --audio-format mp3 --audio-quality 160K --embed-thumbnail --add-metadata --output "%(title)s.%(ext)s"'
alias youtube-music-playlist='youtube-dl -4 --ignore-errors --format bestaudio --extract-audio --audio-format mp3 --audio-quality 160K --embed-thumbnail --add-metadata --output "%(title)s.%(ext)s" --yes-playlist'

# # ex - archive extractor
# # usage: ex <file>
ex () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# init starship
eval "$(starship init bash)"
