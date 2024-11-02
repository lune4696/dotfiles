{
  services = {

    libinput = {
      enable = true;
    };

    xremap = {
      withHypr = true;
      userName = "Lune";
      serviceMode = "system";
      config = {
        modmap = [
          {
            name = "Caps2Ctrl";
            remap = {
              CapsLock = "Ctrl_L";
            };
          }
        ];
      };
    }; 

    xserver = {
      desktopManager.runXdgAutostartIfNone = true;
      xkb.layout = "us";
      videoDrivers = [ "amdgpu" ];
    };
  };
}
