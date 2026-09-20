function main(config, log) {
    const toggleable = ["cache.nixos.org", "aur.archlinux.org", "crates.io"];
    const proxy = "home-manager-mihomo-manager-to-overseas";

    config["proxy-groups"] = (config["proxy-groups"] || []).concat(
        toggleable.map(d => ({
            name: d,
            type: "select",
            proxies: ["DIRECT", proxy],
        }))
    );

    config["rules"] = toggleable.map(d => "DOMAIN-SUFFIX," + d + "," + d);

    return config;
}
