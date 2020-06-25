# CLI support for jaeger interaction
#
# see README.md for details

function jaeger() {
    emulate -L zsh
    local action url jaeger_prefix
    if [[ -n "$1" ]]; then
	action=$1
    else
	action="trace"
    fi

    if [[ -f ~/.jaeger-url."${JAEGER_ENV}" ]] then
       url=$(cat ~/.jaeger-url."${JAEGER_ENV}")
    elif [[ -f ~/.jaeger-url ]]; then
	url=$(cat ~/.jaeger-url)
    fi # TODO add help

    if [[ $action == "trace" ]]; then
	echo "Opening new trace: ${url}/trace/$2"
	open_command "${url}/trace/$2"
    elif [[ $action == "setenv" ]]; then
	export JAEGER_ENV=$2
	url=$3
	echo $url > ~/.jaeger-url."${JAEGER_ENV}"
    elif [[ $action == "switch" ]]; then
	export JAEGER_ENV=$2
    fi
}
