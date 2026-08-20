{ ... }:
{
  my.proxies.bai-piao-ji-chang = {
    files = [
      ./config.sh.example
      ./to-global.js
      ./remove-fallback-filter.js
    ];
    port = 42931;
  };
}
