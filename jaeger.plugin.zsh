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

    
    if [[ -f ~/.jaeger-url ]]; then
	url=$(cat ~/.jaeger-url)
    fi # TODO add help

    if [[ $action == "trace" ]]; then
	echo "Opening new trace: ${url}/trace/$2"
	open_command "${url}/trace/$2"
    fi
}
