{ lib, config, pkgs, ... }:
with lib;
let
  keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCccE1cE/FqIdVS8WPMhofO3jMp78hQQKACcrRnJLfUrrNhj2OCLu35tzrsLbivYhgQjHq3ieiK0amNF0SYwSoWZaiQe2DnuS6KQRHnWwJqURwr1cxCVvLKCRDK2G89lPwPYaO1g00VlHS5bSgO+PD/SwyunP7kgMKf4uRfSvdF21OwLxjLQtZw3Y1Z4NCG4cyse0o7umSTUnWTTaHLn9ivu6XnCHKdIhcNTVDFZtwP63OKl7pbAA7/pK1Wlp8WYQx5rdC50RADI5fklJ/uInCMf1FpH3u0h4IAcbNFMtR2v8lM44bX/zOlb3T3u0sGKCt2YkF5v/VNTx+9SnNWfFZDQtf9uvMmfg/pN0EivP1frIbgyocipOSH6nPayQ/jPi3E0mnzB4rbGnbuoEOC/iIcJCRb1s6a+qfsbRrUZX9rYEm1JDxKtHCmEZFkv0GvpFp4WH61HY1oHcTucJ1J6pA27WMb4/HtKIL0cNFCPdxhChOvw6QY0WeB/ecMyuPVR2Y4e6qtJMV3So16wavo7PS5ZHrupEmkIvb2glqhktMqOn6LJ3Mhc9uTME5jUbDsuRi75BVRtrJSGOHH0W4/JARqQ7BdpXKb1Pkw1Xl1Oj5XBUfDdxGBWJSgWaem/UmSLAlRRmnZLnPlemaMSjtnlAjOF+c0a11LoekD9GlNH/0o7Q== mkelley@mbp-16-do"
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCXOPgbAU3j0gEzNu3quW9s4lGQ20zGYNa1NHlNmbylZ+mYBbqB2QJdevkYpQmaic+mJBxlKmODB4gIb22kjOwlymlSv+tQ/NcAY1aV/KNBAdardt0yWWGfmmGdpRLQ7WoHpXQsMz0ParLW54nsY1O9E/5t8iKQ3TMPI5QkLvAxgDWuZLSLxEIdJIBrXjVtbqNSu3OayDkQVUxy9brjA27Gmt2YRBrprqn/OGXI9fHBIIBsl0WcHEn16AbNIL0PtqslhKv1oG0Kr4N4trwrhKvidNzbCmQGVGfshYKtE+7uFX0kQfatQBXWgOhzqADh2ZCORHO1UJmLz2W5mJyFCw0GuTu9HKKT2OEZCEcxJacAvJTACaZWqTwTPaGPVxlkUAtZYsWk21EeyLDyqnQjtlslGRAkhHmYQe08WFtTLrFQof5cRogP9bYFat73K4zhO8lX/SRcT7uXV392RpluAlC71rdnw4o7HeoOqMBywMaikY0WxtRCaMdTwF+dkvnp1IPnGLljMOuyJt4rfEfGz+0JCVv5TBkcRsY743R8dH1Qt7J3dczrArJu9+ypUa0YnrKAiuIUtnwh9ybvs928sxkTEWdCyj3OSeGbAZuzD5B3KyBFdAk7G3jYf0Z8veJabuBm5ysqtcdmgcg5FaZUH246ApnKwyDMtIO987SubAam3Q== ipad@Termius"
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC/JhK7ZsbEujlTs24nD6FJGTPw0sPk2r/cfOmbbCQWnwluZm3pHDZTP4puNxqEP042tJZrSo2pv1zb131Sb9U7s5YqxGeT1nkHOJq8D2iv4KQ58vBWxs0ezKDO9NQaZqrjuRXpAKWnWJ6yScQ8jaXwfYTPK4adzwF1DQzuaVLHam6lpNDemEMnfbFpxTjTmIhjv3qDiIxsW/1V4Z/HkYaMOEFepGh0EKYNuUwoapRN5DpT72Zd+4JFZp/4Vk5uA++gkDS8Yj01rBTaH6uDgvsO91jNr7oDnKhLfHW6FWbs/kX6ajYufajSlr1PG8CUp9lB8NpzwVO58QzV60j9AGguh+YwlrYYyNnxSUk7UlOXXv2ZGsv5tqSi9baFR1FRBFwsfnnOb9skPsp/Jj5lQGX0U+Zs55Jk69iypyTvOuYxltcbXoqUP/hZkA53Fn8vGblWn/zmNNbVR59+4jNPKDtzRWm31u5rRUS75ylQLgui5qOPT2Qb03iPsJZI+Ej69zf+V1wFDqJ+cYgUrzKWd+JjpBMQE9Uk/BP6SJ9Bd8YUqPytlaUYoHAmOIxpFjm2iM8RMqDII/8faTMErUbElZ1UBCSdo3Gl2Eh4LCQJTp/iH2ZLO0eBzD0wFNVAccsXXki09xfGic3YGcG1WgNW9NHJeGAg5Fm27C5kaAzjC+kkGw== ipad@blink"
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDWUQM5BDw1agZ0e5HkVbG2b4eIBzLcaf6dlmoI6rd3B6yq609/Szc+NMNZplk24hKyL7ug7oJvJjE144RRmvhF7lOMiHMIbHFq0jK9Tl17dOMYfrct0H8EA0JlncXuJn7N+Y1sVgzgIG86rB43TF1WU17gziA1FOS0xV1+vXGHZQ7lQnOXqr0SlPNadNDUTx23mey4RH+MVw0f9hAWKUEqItJu7SZi2NXvg/Ddx+Ymf7Kds20EOCStmqK5Xi+mJXY/dwNfW6xy9cXNw5Ozbt+zJGlUMEdP4rIvesi6HtHrpw9oI/QswTQ+yh2NoLGig4QcD+QpgNyfHsmYYe3W7oEmT9UOfNx5uyVIWMoHpLoVur1YEJvBHBADTEWBgy4SBDRf+tiUgIkEKJPIpDjInKyKLIbCrf4rYVfJ1efZAaY0ocN3n01QWZLUidHun7vrEEqBVtUm3ZFrbaBB4Yictwwwj/A7QwcPPnaj/tRxQe1gq73zv+jJPEI0QubsidpkhyM= michaelkelley@mbp-15-personal"
  ];
  cfg = config.mkelley.home;
in {
  options = {
    mkelley.home = {
      user = mkOption {
        type = types.str;
        default = "mkelley";
      };

      group = mkOption {
        type = types.str;
        default = "users";
      };

      includeDOVPN = mkOption {
        type = types.bool;
        default = false;
      };
    };
  };

  config = {
    users.users = {
      "${cfg.user}" = {
        isNormalUser = true;
        home = "/home/${cfg.user}";
        description = "Michael Kelley";
        extraGroups = [ "wheel" ];
        shell = pkgs.fish;
        openssh.authorizedKeys.keys = keys;
      };

      root = {
        openssh.authorizedKeys.keys = keys;
      };
    };

    home-manager.users."${cfg.user}" = {
      home = {
        stateVersion = "22.05";
        file = {
          ".config" = {
            source = ../../dotfiles/.config;
            recursive = true;
          };

          ".gitconfig" = {
            source = (../../dotfiles/.gitconfig. + "${cfg.user}");
          };

          "bin/do-vpn.sh" = mkIf cfg.includeDOVPN {
            source = ../../bin/do-vpn.sh;
          };
          "bin/hipreport.sh" = mkIf cfg.includeDOVPN {
            source = ../../bin/hipreport.sh;
          };
        };
      };
    };
  };
}
