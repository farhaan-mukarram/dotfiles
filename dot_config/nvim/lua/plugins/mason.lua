-- Return nothing for now
if true then
  return {}
end

-- Add additional tools needed in the config below
return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "stylua",
      "shellcheck",
      "shfmt",
      "flake8",
    },
  },
}
