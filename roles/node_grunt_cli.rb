name "node_grunt_cli"
description "Install Node.js and Grunt CLI"
run_list(
  "recipe[nodejs]",
  "recipe[grunt_cookbook::install_grunt_cli]"
)
default_attributes(
  :nodejs => {
    :version => "0.10.26",
  }
)
