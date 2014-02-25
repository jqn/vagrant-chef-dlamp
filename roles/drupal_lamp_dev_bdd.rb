name "drupal_lamp_dev_bdd"
description "A LAMP + Memcached stack for Drupal with BDD development and testing tools."
run_list(
  "role[apache2_mod_php]",
  "role[drupal]",
  "role[drupal_dev]",
  "role[memcached]",
  "role[mysql_server]",
  "recipe[drupal::multisite]",
  "role[node_grunt_cli]"
)
# TODO Add recipe to create dev sites via Drush make.
