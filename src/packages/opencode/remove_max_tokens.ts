import { Plugin } from "@opencode-ai/plugin"

export const AzurePatch: Plugin = async (ctx) => {
    return {
        auth: {
            provider: "35-220-164-252-3888",
            methods: [],
            loader: async (getAuth, provider) => {
                return {
                    async fetch(input, init) {
                        const opts = init ?? {}
                        if (opts.body && typeof opts.body === "string") {
                            try {
                                const body = JSON.parse(opts.body)
                                if (body.max_tokens !== undefined) {
                                    body.max_completion_tokens = body.max_tokens
                                    delete body.max_tokens
                                    opts.body = JSON.stringify(body)
                                }
                            } catch (e) { }
                        }
                        return fetch(input, {
                            ...opts,
                            timeout: false,
                        })
                    },
                }
            },
        },
    }
}
