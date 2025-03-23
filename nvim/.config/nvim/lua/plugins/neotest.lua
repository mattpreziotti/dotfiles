return {
  { "nvim-neotest/neotest-go", "haydenmeade/neotest-jest" },
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = {
        ["neotest-jest"] = {
          cwd = vim.fn.getcwd(),
        },
        "neotest-go",
      },
    },
  },
}
