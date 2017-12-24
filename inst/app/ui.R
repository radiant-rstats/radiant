## ui for radiant
navbar_proj(
  do.call(
    navbarPage,
    c(
      "Radiant",
      getOption("radiant.nav_ui"),
      getOption("radiant.design_ui"),
      getOption("radiant.basics_ui"),
      getOption("radiant.model_ui"),
      getOption("radiant.multivariate_ui"),
      getOption("radiant.shared_ui"),
      help_menu("help_ui")
    )
  )
)
