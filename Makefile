EXAMPLE_SITE := exampleSite
CONFIG_GH_PAGES := config_for_github_pages.toml
CONFIG := config.toml
THEMES := ../../

public:
	hugo -s ${EXAMPLE_SITE} --config ${CONFIG_GH_PAGES} --themesDir ${THEMES}

server:
	hugo -s ${EXAMPLE_SITE} --themesDir ${THEMES} server

.PHONY: public server
