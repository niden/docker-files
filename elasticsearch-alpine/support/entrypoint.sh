#!/bin/sh

ES_YML="/opt/elasticsearch/config/elasticsearch.yml"
ES_OPTS="-Des.config=$ES_YML"
ES_HTTP_PORT="9200"

set_http_port() {
	local _http_port=${ELASTICSEARCH_PORT:-"9200"}

	if [ ! "${_http_port}" == "9200" ]; then
		echo "=> Using port '${_http_port}'"
		ES_HTTP_PORT="${_http_port}"
		ES_OPTS="$ES_OPTS -Des.http.port=${_http_port}"
	fi
}

set_network_bind() {
	local _network=${ELASTICSEARCH_NET:-"any"}

	if [ ! "${_network}" == "any" ]; then
		echo "=> Using '${_network}' for network binding"
		ES_OPTS="$ES_OPTS -Des.network.host=${_network}"
	fi
}

shutdown() {
	local pid=$1

	echo "=> Shutdown requested, stopping Elasticsearch..."

	echo -e 'POST /_cluster/nodes/_local/_shutdown HTTP/1.0\r\n\r\n' | nc localhost $ES_HTTP_PORT > /dev/null

	# wait for process to terminate
	wait $pid

	# return process exit code
	exit $?
}

start() {
	set_network_bind
	set_http_port

	# launch as background process
	/opt/elasticsearch/bin/elasticsearch "$ES_OPTS" &

	local pid=$!

	trap "shutdown $pid" SIGINT SIGTERM

	wait
}

start