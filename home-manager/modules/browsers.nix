{ config, pkgs, ... }:

{
  # Browser configurations and Vimium settings
  
  # Create Vimium configuration file
  home.file.".config/vimium/vimium-config.json".text = ''
    {
      "keyMappings": "unmapAll\nmap j scrollDown\nmap k scrollUp\nmap h scrollLeft\nmap l scrollRight\nmap gg scrollToTop\nmap G scrollToBottom\nmap d scrollPageDown\nmap u scrollPageUp\nmap f LinkHints.activateMode\nmap F LinkHints.activateModeToOpenInNewTab\nmap / enterFindMode\nmap n performFind\nmap N performBackwardsFind\nmap yy copyCurrentUrl\nmap p openCopiedUrlInCurrentTab\nmap P openCopiedUrlInNewTab\nmap i enterInsertMode\nmap v enterVisualMode\nmap gi focusInput\nmap t createTab\nmap x removeTab\nmap X restoreTab\nmap << moveTabLeft\nmap >> moveTabRight",
      "searchEngines": "g: https://www.google.com/search?q=%s\ngh: https://github.com/search?q=%s\nnix: https://search.nixos.org/packages?query=%s",
      "scrollStepSize": 100
    }
  '';
  
  # Browser bookmarks for work profile
  home.file.".config/browser-bookmarks/work.html" = {
    enable = config.home.username == "ricardo-work";
    text = ''
      <!DOCTYPE NETSCAPE-Bookmark-file-1>
      <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=UTF-8">
      <TITLE>Bookmarks</TITLE>
      <H1>Bookmarks Menu</H1>
      <DL><p>
        <DT><H3>Work</H3>
        <DL><p>
          <DT><A HREF="https://github.com/ricardosllm">GitHub Profile</A>
          <DT><A HREF="https://github.com/gini">Gini Organization</A>
          <DT><A HREF="https://nixos.org/manual/nix/stable/">Nix Manual</A>
          <DT><A HREF="https://search.nixos.org/packages">Nix Packages</A>
        </DL><p>
        <DT><H3>Documentation</H3>
        <DL><p>
          <DT><A HREF="https://neovim.io/doc/">Neovim Docs</A>
          <DT><A HREF="https://www.lazyvim.org/">LazyVim</A>
          <DT><A HREF="https://docs.docker.com/">Docker Docs</A>
        </DL><p>
      </DL><p>
    '';
  };
}