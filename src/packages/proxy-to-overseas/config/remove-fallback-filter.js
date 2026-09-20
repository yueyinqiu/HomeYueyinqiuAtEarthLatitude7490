function main(config, log) {
    if (config["dns"]) {
        delete config["dns"]["fallback-filter"];
    }
    return config;
}
