{pkgs, ...}: {
  environment.systemPackages = [
    pkgs.ffmpeg-full
  ];
}
