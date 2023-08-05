#!/usr/bin/env bash

render_api() {
    local method="$1"
    local path="$2"
    local body="$3"

    curl -s --request "$method" \
        --url "https://api.render.com/v1$path" \
        --header "Accept: application/json" \
        --header "Content-Type: application/json" \
        --header "Authorization: Bearer $RENDER_API_KEY" \
        --data "$body"
}

scale_service() {
    local service_id="$1"
    local num_instances="$2"
    render_api "POST" "/services/$service_id/scale" "{\"numInstances\": $num_instances}"
}

main() {
    if [[ -z "${RENDER_API_KEY:-}" ]]; then
        echo "RENDER_API_KEY is not set"
        exit 1
    fi

    if [[ -z "${DESIRED_INSTANCES:-}" ]]; then
        echo "DESIRED_INSTANCES is not set"
        exit 1
    fi

    if [[ -z "${SERVICE_ID:-}" ]]; then
        echo "SERVICE_ID is not set"
        exit 1
    fi

    echo "Scaling service $SERVICE_ID to $DESIRED_INSTANCES instances..."
    scale_service "$SERVICE_ID" "$DESIRED_INSTANCES"
    echo "Done"
}

main