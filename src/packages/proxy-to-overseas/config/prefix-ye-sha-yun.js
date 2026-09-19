function main(config, log) {
    for (const p of config["proxies"]) {
        p["name"] = "夜煞云-" + p["name"];
    }
    return config;
}
