return {
  'stevearc/conform.nvim',
  cmd = { 'ConformInfo' },
  opts = {
    format = {
      timeout_ms = 3000,
      async = false,
      quiet = false,
    },
    formatters_by_ft = {
      c = { 'clang-format' },
      cpp = { 'clang-format' },
      html = { 'htmlbeautifier' },
      lua = { 'stylua' },
      go = { 'goimports', 'gofumpt' },
      hcl = { 'packer_fmt' },
      python = { 'black' },
      sh = { 'shfmt' },
      terraform = { 'terraform_fmt' },
      ['terraform-vars'] = { 'terraform_fmt' },
      tf = { 'terraform_fmt' },
      toml = { 'taplo' },
      yaml = { 'yamlfmt' },
    },
    formatters = {
      ['clang-format'] = {
        prepend_args = { '-style=file', '-fallback-style=LLVM' },
      },
      injected = { options = { ignore_errors = true } },
    },
  },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_fallback = true }
      end,
      mode = 'n',
      desc = 'Conform format',
    },
  },
}
