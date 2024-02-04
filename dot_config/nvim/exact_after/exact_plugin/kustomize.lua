require("kustomize").setup({
  deprecations = {
    kube_version = "1.29",
  },
  enable_key_mappings = false,
})
