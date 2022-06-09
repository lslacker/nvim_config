local config = {

cmd = {

"java",
"-Declipse.application=org.eclipse.jdt.ls.core.id1",
"-Dosgi.bundles.defaultStartLevel=4",
"-Declipse.product=org.eclipse.jdt.ls.core.product",
"-Dlog.protocol=true",
"-Dlog.level=ALL",
"-Xms1g",
"--add-modules=ALL-SYSTEM",
"--add-opens",
"java.base/java.util=ALL-UNNAMED",
"--add-opens",
"java.base/java.lang=ALL-UNNAMED",
-- increase lombok Plug in support ,getter setter good bye
"-javaagent:/Users/luanm/Workspaces/apps/jdt_language_server/lombok.jar",
"-Xbootclasspath/a:/Users/luanm/Workspaces/apps/jdt_language_server/lombok.jar",
"-jar",
"/Users/luanm/Workspaces/apps/jdt_language_server/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar",
"-configuration",
"/Users/luanm/Workspaces/apps/jdt_language_server/config_mac",
"-data",
"/Users/luanm/Workspaces/apps/jdt_language_server/workspace"
},
root_dir = require("jdtls.setup").find_root({
".git", "mvnw", "gradlew"}),
settings = {
  java = {
  }
},
init_options = {
  bundles = {
  }
}
}
require("jdtls").start_or_attach(config)
