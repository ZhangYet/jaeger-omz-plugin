# CLI support for jaeger interaction
#
# see README.md for details

function jaeger() {
    emulate -L zsh
    local action jaeger_url jaeger_prefix
    if [[ -n "$1" ]]; then
	action=$1
    elif [[ -f .jaeger-default-action ]]; then
	action=$(cat .jaeger-default-action)
    elif [[ -f ~/.jaeger-default-action ]]; then
	action=$(cat ~/.jaeger-default-action)
    elif [[ -n "${JAEGER_DEFAULT_ACTION}" ]]; then
	action=${JAEGER_DEFAULT_ACTION}
    else
	action="trace"
    fi

    if [[ -f .jaeger-url ]]; then
	jaeger-url=$(cat .jaeger-url)
    fi # TODO add help

    if [[ $action == "trace" ]]; then
	echo "Opening new trace"
	open_command "${jaeger-url}/trace/$2"
    if
}
