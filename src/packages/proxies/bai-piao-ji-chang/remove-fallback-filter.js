function main(config, log) {
    config["dns"].remove("fallback-filter");
    return config;
}