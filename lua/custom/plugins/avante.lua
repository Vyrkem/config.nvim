-- Helper function to create OpenCode ACP provider config
local function opencode_acp(model)
  return {
    command = 'opencode',
    args = { 'acp' },
    env = {
      OPENCODE_API_KEY = os.getenv 'OPENCODE_API_KEY',
      OPENCODE_MODEL = model,
    },
  }
end

-- Model list for the selector
local opencode_models = {
  { name = 'opencode', display = 'Opus 4.5 (default)', model = 'anthropic/claude-opus-4-5-20251101' },
  { name = 'opencode-opus-4', display = 'Opus 4', model = 'anthropic/claude-opus-4-20250514' },
  { name = 'opencode-opus-4.5', display = 'Opus 4.5', model = 'anthropic/claude-opus-4-5-20251101' },
  { name = 'opencode-sonnet-4', display = 'Sonnet 4', model = 'anthropic/claude-sonnet-4-20250514' },
  { name = 'opencode-sonnet-4.5', display = 'Sonnet 4.5', model = 'anthropic/claude-sonnet-4-5-20250929' },
  { name = 'opencode-haiku', display = 'Haiku 4.5', model = 'anthropic/claude-haiku-4-5-20251001' },
  { name = 'opencode-codex', display = 'Codex 5.2', model = 'openai/gpt-5.2-codex' },
  { name = 'opencode-codex-max', display = 'Codex Max', model = 'openai/gpt-5.1-codex-max' },
  { name = 'opencode-codex-mini', display = 'Codex Mini', model = 'openai/gpt-5.1-codex-mini' },
}

return {
  'yetone/avante.nvim',
  event = 'VeryLazy',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
  },
  opts = {
    provider = 'opencode',
    -- ACP providers for OpenCode with different models
    acp_providers = {
      -- Default (Opus 4.5)
      opencode = opencode_acp 'anthropic/claude-opus-4-5-20251101',
      -- Claude Opus
      ['opencode-opus-4'] = opencode_acp 'anthropic/claude-opus-4-20250514',
      ['opencode-opus-4.5'] = opencode_acp 'anthropic/claude-opus-4-5-20251101',
      -- Claude Sonnet
      ['opencode-sonnet-4'] = opencode_acp 'anthropic/claude-sonnet-4-20250514',
      ['opencode-sonnet-4.5'] = opencode_acp 'anthropic/claude-sonnet-4-5-20250929',
      -- Claude Haiku
      ['opencode-haiku'] = opencode_acp 'anthropic/claude-haiku-4-5-20251001',
      -- OpenAI Codex
      ['opencode-codex'] = opencode_acp 'openai/gpt-5.2-codex',
      ['opencode-codex-max'] = opencode_acp 'openai/gpt-5.1-codex-max',
      ['opencode-codex-mini'] = opencode_acp 'openai/gpt-5.1-codex-mini',
    },
  },
  config = function(_, opts)
    require('avante').setup(opts)

    -- Create custom command to select OpenCode models
    vim.api.nvim_create_user_command('OpenCodeModels', function()
      local items = {}
      for _, m in ipairs(opencode_models) do
        table.insert(items, m.display .. ' (' .. m.name .. ')')
      end

      vim.ui.select(items, { prompt = 'Select OpenCode Model:' }, function(choice, idx)
        if choice and idx then
          local selected = opencode_models[idx]
          require('avante.api').switch_provider(selected.name)
          vim.notify('Switched to: ' .. selected.display, vim.log.levels.INFO)
        end
      end)
    end, { desc = 'Select OpenCode model' })
  end,
  build = 'make',
}
