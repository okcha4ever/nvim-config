vim.opt.relativenumber = true

-- luasnip
local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("typescript", {
  s("nget", {
    t {
      'import { NextRequest, NextResponse } from "next/server";',
      "",
      "export async function GET(request: NextRequest) {",
      "  try {",
      '    return NextResponse.json("done", { status: 200 });',
      "  } catch {",
      '    return NextResponse.json("something went wrong", { status: 500 });',
      "  }",
      "}",
    },
  }),
  s("npost", {
    t {
      'import { NextRequest, NextResponse } from "next/server";',
      "",
      "export async function POST(request: NextRequest) {",
      "  const {} = await request.json()",
      "  try {",
      '    return NextResponse.json("done", { status: 200 });',
      "  } catch {",
      '    return NextResponse.json("something went wrong", { status: 500 });',
      "  }",
      "}",
    },
  }),
  s("npatch", {
    t {
      'import { NextRequest, NextResponse } from "next/server";',
      "",
      "export async function PATCH(request: NextRequest) {", -- Changed to PATCH
      "  const {} = await request.json()",
      "  try {",
      '    return NextResponse.json("done", { status: 200 });',
      "  } catch {",
      '    return NextResponse.json("something went wrong", { status: 500 });',
      "  }",
      "}",
    },
  }),
  s("ndelete", {
    t {
      'import { NextRequest, NextResponse } from "next/server";',
      "",
      "export async function DELETE(request: NextRequest) {", -- Changed to DELETE
      "  const {} = await request.json()",
      "  try {",
      '    return NextResponse.json("done", { status: 200 });',
      "  } catch {",
      '    return NextResponse.json("something went wrong", { status: 500 });',
      "  }",
      "}",
    },
  }),
})

-- TSX and JSX snippets
ls.add_snippets({ "typescriptreact", "javascriptreact" }, {
  s("rafce", {
    t {
      'import { NextRequest, NextResponse } from "next/server";',
      "",
      "export async function POST(request: NextRequest) {",
      "  const {} = await request.json()",
      "  try {",
      '    return NextResponse.json("done", { status: 200 });',
      "  } catch {",
      '    return NextResponse.json("something went wrong", { status: 500 });',
      "  }",
      "}",
    },
  }),
})


return {
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "configs.null-ls"
    end,
  },
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
        "tailwindcss-language-server",
        "typescript-language-server",
        "eslint-lsp",
        "prisma-language-server",
      },
    },
  },

  {
    "windwp/nvim-ts-autotag",
    ft = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "javascript",
        "typescript",
        "jsx",
        "tsx",
        "go",
        "python",
        "prisma",
      },
    },
  },

  {
    "Exafunction/codeium.vim",
    event = "BufEnter",
    config = function()
      vim.keymap.set("i", "<C-g>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true, silent = true })
    end,
  },
  'prisma/vim-prisma'
}
