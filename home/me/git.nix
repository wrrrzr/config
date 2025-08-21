{ ... }:

{
  programs.git = {
    enable = true;
    userEmail = "wozrer@proton.me";
    userName = "wrrrzr";
    extraConfig = {
      init.defaultBranch = "master";
      gpg.format = "ssh";
      user.signingkey = "~/.ssh/keygithub.pub";
      commit.gpgsign = true;
    };
  };
}
