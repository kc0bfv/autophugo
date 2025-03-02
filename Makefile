EXAMPLE_SITE := exampleSite
CONFIG_GH_PAGES := config_for_github_pages.toml
CONFIG := config.toml
THEMES := ../../

default: check_github_pages

github_pages:
	hugo -s ${EXAMPLE_SITE} --config ${CONFIG_GH_PAGES} --themesDir ${THEMES}

check_github_pages: github_pages
	diff -I 'name="generator"' exampleSite/public/index.html test_reference/index.html

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

clean:
	rm -rf exampleSite/resources exampleSite/public exampleSiteNoAlbum/resources exampleSiteNoAlbum/public

.PHONY: public server clean
