{
  lib,
  melpaBuild,
  emacsPackages,
}:
melpaBuild {
  pname = "qbittorrent-transient";
  version = "1.0.0";

  src = ./.;

  packageRequires = with emacsPackages; [
    transient
  ];

  meta = {
    homepage = "https://github.com/theobori/qbittorrent-transient";
    description = "Transient interface for qBittorrent";
    license = lib.licenses.gpl3Plus;
    maintainers = with lib.maintainers; [ theobori ];
  };
}
