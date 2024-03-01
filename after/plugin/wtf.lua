require("wtf").setup({
    -- Default AI popup type
    popup_type = "popup",
    -- An alternative way to set your API key
    openai_api_key = "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",
    -- ChatGPT Model
    openai_model_id = "gpt-4",
    -- Send code as well as diagnostics
    context = true,
    -- Set your preferred language for the response
    language = "english",
    -- Any additional instructions
    additional_instructions = "Start the reply with 'OH HAI THERE'",
    -- Default search engine, can be overridden by passing an option to WtfSeatch
    search_engine = "google" ,
    -- Callbacks
    hooks = {
        request_started = nil,
        request_finished = nil,
    },
    -- Add custom colours
    winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
})
