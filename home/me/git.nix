{ ... }:

{
  programs.git = {
    enable = true;
    settings = {
      commit.gpgsign = true;
      gpg.format = "ssh";
      init.defaultBranch = "master";
      user.email = "wozrer@proton.me";
      user.name = "wrrrzr";
      user.signingkey = "~/.ssh/keygithub.pub";
    };
  };
}
