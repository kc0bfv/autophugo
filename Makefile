EXAMPLE_SITE := exampleSite
CONFIG_GH_PAGES := config_for_github_pages.toml
CONFIG := config.toml
THEMES := ../../

public:
	hugo -s ${EXAMPLE_SITE} --config ${CONFIG_GH_PAGES} --themesDir ${THEMES}

server:
	hugo -s ${EXAMPLE_SITE} --themesDir ${THEMES} server

serverNoAlbum:
	hugo -s exampleSiteNoAlbum --themesDir ${THEMES} server

no_canonify_server_long_url_test:
	hugo -s ${EXAMPLE_SITE} --themesDir ${THEMES} server -b http://localhost:1313/themes/autophugo/

canonify_server_long_url_test:
	export HUGO_CANONIFYURLS=true && hugo -s ${EXAMPLE_SITE} --themesDir ${THEMES} server -b http://localhost:1313/themes/autophugo/

no_canonify_server_short_url_test:
	hugo -s ${EXAMPLE_SITE} --themesDir ${THEMES} server -b http://localhost:1313/

canonify_server_short_url_test:
	export HUGO_CANONIFYURLS=true && hugo -s ${EXAMPLE_SITE} --themesDir ${THEMES} server -b http://localhost:1313/


.PHONY: public server
