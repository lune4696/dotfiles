{ lib, ... }: {
  home.sessionVariables.GTK_IM_MODULE = lib.mkForce "";
}
