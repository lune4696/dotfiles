{ pkgs, ... }: { 
  users = {
    defaultUserShell = pkgs.bash;
    users.mlab = {
      isNormalUser = true;
      description = "mlab";
      extraGroups = [ "networkmanager" "wheel" "light" "audio" "dialout" "lp" "docker" ];
      packages = with pkgs; [];
    }; 

    groups = {
      uinput.members = ["mlab"];
      input.members = ["mlab"];
    };
  };
}
