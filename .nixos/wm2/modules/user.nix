{ pkgs, ... }: { 
  users = {
    defaultUserShell = pkgs.bash;
    users.lune = {
      isNormalUser = true;
      description = "lune";
      extraGroups = [ "networkmanager" "wheel" "light" "audio" "dialout" "lp" "docker" ];
      packages = with pkgs; [];
    }; 

    groups = {
      uinput.members = ["lune"];
      input.members = ["lune"];
    };
  };
}
