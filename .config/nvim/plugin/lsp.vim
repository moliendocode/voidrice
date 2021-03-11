lua << EOF

local on_attach = require'completion'.on_attach

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = True

require'lspconfig'.pyls.setup{ on_attach=require'completion'.on_attach }

require'lspconfig'.bashls.setup{ on_attach=require'completion'.on_attach }

require'lspconfig'.rust_analyzer.setup{ on_attach=require'completion'.on_attach }

require'lspconfig'.gopls.setup{ on_attach=require'completion'.on_attach }

require'lspconfig'.tsserver.setup{ on_attach = on_attach, capabilities = capabilities }

require'lspconfig'.html.setup{ on_attach = on_attach }

require'lspconfig'.jsonls.setup{
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
        end
      }
    }
}
EOF