#!/usr/bin/env bash

export OTEL_SERVICE_NAME=${SERVICE_NAME}
export OTEL_EXPORTER_OTLP_ENDPOINT=${OTEL_EXPORTER_OTLP_ENDPOINT:-http://tempo:4317}
export OTEL_RESOURCE_ATTRIBUTES=${OTEL_RESOURCE_ATTRIBUTES:-service.name=${OTEL_SERVICE_NAME},k8s_app=${K8S_APP}}
export OTEL_AGENT_VERSION=${OTEL_AGENT_VERSION:-v1.24.0}
export OTEL_AGENT_PATH=/app/agent
echo "-----------------------------执行了---------------------------------------------------"
export JAVA_OPTS="$JAVA_OPTS -javaagent:${OTEL_AGENT_PATH}/opentelemetry-javaagent-${OTEL_AGENT_VERSION}.jar"
