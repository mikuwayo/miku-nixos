{ config, pkgs, inputs, ... }:
{
  # Tag each generation with Git hash
  system.configurationRevision =
    if (inputs.self ? rev)
      then inputs.self.shortRev
    else throw "Refusing to build from a dirty Git tree!";

  system.nixos.label = "GitRev.${config.system.configurationRevision}.Rel.${config.system.nixos.release}";
}
