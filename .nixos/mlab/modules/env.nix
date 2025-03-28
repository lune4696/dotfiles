{ pkgs, ... }: {
  environment = {
    variables = {
      EDITOR = "hx";
      MOZ_ENABLE_WAYLAND = 1; # To fix the issue that firefox/floorp are running on Xwayland.
      GTK_USE_PORTAL = 1;  
    };
    sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/lune/.steam/root/compatibilitytools.d";
    };
  };
}
