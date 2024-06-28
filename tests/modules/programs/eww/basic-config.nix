{ pkgs, ... }: {
  config = {
    programs.eww = {
      enable = true;
      package = pkgs.writeScriptBin "dummy-eww" "";
      configYuck = ''
        (defwindow example
             :monitor 0
             :geometry (geometry :x "0%"
                                 :y "20px"
                                 :width "90%"
                                 :height "30px"
                                 :anchor "top center")
             :stacking "fg"
             :reserve (struts :distance "40px" :side "top")
             :windowtype "dock"
             :wm-ignore false
          "example content")
      '';
      configScss = ''
        window {
          background: pink;
        }
      '';
    };

    nmt.script = ''
      assertFileExists home-files/.config/eww/eww.yuck
      assertFileExists home-files/.config/eww/eww.scss
    '';
  };
}
