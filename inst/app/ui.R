## ui for design menu in radiant
do.call(navbarPage,
  c("Radiant", getOption("radiant.nav_ui"), design_ui, basics_ui, model_ui,
    multivariate_ui, getOption("radiant.shared_ui"),
    help_menu("help_ui"))
)
