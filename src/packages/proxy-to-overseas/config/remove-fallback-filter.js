function main(config, log) {
    if (config["dns"]) {
        config["dns"].remove("fallback-filter");
    }
    return config;
}
