function main(config, log) {
    for (const p of config["proxies"]) {
        p["name"] = "白嫖机场-" + p["name"];
    }
    return config;
}
