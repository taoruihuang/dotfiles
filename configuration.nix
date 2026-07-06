{ ... }:

{
  # Determinate already manages the Nix daemon, so nix-darwin shouldn't.
  nix.enable = false;

  nixpkgs.config.allowUnfree = true;
  nixpkgs.hostPlatform = "aarch64-darwin"; # use x86_64-darwin for Intel CPU

  system.primaryUser = "taoruihuang";
  users.users.taoruihuang = {
    home = "/Users/taoruihuang";
  };
  system.stateVersion = 6;
  system.defaults = {
    NSGlobalDomain = {
      AppleInterfaceStyle = "Dark";
      KeyRepeat = 2;          # fast key repeat
      InitialKeyRepeat = 15;  # short delay before repeat
      _HIHideMenuBar = false; # keep the menu bar visible
      AppleShowAllExtensions = true;
    };
    dock.autohide = false;
    finder.FXPreferredViewStyle = "Nlsv";  # list view by default
    finder.CreateDesktop = false;          # clean desktop
    trackpad.Clicking = true;              # tap to click
  };
  nix-homebrew = {
    enable = true;
    user = "taoruihuang";
    autoMigrate = true;
  };
  homebrew = {
    enable = true;
    onActivation.cleanup = "none"; # first apply: do not remove unlisted Homebrew packages
    onActivation.autoUpdate = true;
    onActivation.extraFlags = [ "--force" ];
    brews = [
      "automake"
      "bison"
      "chruby"
      "fd"
      "fzf"
      "gcc"
      "gdbm"
      "gh"
      "git"
      "herdr"
      "jq"
      "lazygit"
      "libtermkey"
      "libvterm"
      "libyaml"
      "mingw-w64"
      "msgpack"
      "neovim"
      "node"
      "openssl@1.1"
      "python@3.13"
      "ripgrep"
      "ruby-install"
      "starship"
      "tmux"
      "wget"
      "zsh-autosuggestions"
      "zsh-syntax-highlighting"
    ];
    casks = [
      "claude-code"
      "font-hack-nerd-font"
      "ngrok"
      "opensuperwhisper"
      "wezterm"
    ];
  };
}
