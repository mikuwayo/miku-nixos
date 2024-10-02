{ config, lib, pkgs, ... }:

{
  time.timeZone       = "Europe/Paris";
  i18n.defaultLocale  = "en_US.UTF-8";
  networking.hostName = "kirby";

  wsl = { 
    enable              = true;
    defaultUser         = "miku";
    nativeSystemd       = true;   # Don't add Windows' PATH
    useWindowsDriver    = true;   # OpenGL support
    interop.includePath = false;
  };
   
  users = {
    mutableUsers = false;
    users.miku = {
      createHome   = true;
      isNormalUser = true;
      password     = "hihi";
      group        = "users";
      extraGroups  = [ "wheel" ];
    };
  };
  
  security.sudo = {
    execWheelOnly = true;

    # Doesn't ask passwd by default for some reason
    defaultOptions = [ "SETENV" "PASSWD" ]; 
	};

	# No Touchy.
	system.stateVersion = "24.05";
} 
