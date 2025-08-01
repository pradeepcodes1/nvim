local jdtls = require("jdtls")
local mason_pkg = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
local workspace = vim.fn.stdpath("cache") .. "/jdtls/" ..
                  vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

jdtls.start_or_attach({
  cmd = { mason_pkg .. "/bin/jdtls" },      -- uses Mason wrapper
  root_dir = jdtls.setup.find_root({ ".git", "mvnw", "gradlew",
                                     "pom.xml", "build.gradle" }),
  data = workspace,
})

