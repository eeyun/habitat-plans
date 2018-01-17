#!/bin/bash

export CONCOURSE_BASIC_AUTH_USERNAME="{{cfg.concourse.username}}"
export CONCOURSE_BASIC_AUTH_PASSWORD="{{cfg.concourse.password}}"
export CONCOURSE_EXTERNAL_URL="${CONCOURSE_EXTERNAL_URL}"

{{#if bind.database ~}}
{{#with bind.database.first as |pg| }}
export CONCOURSE_POSTGRES_HOST="{{pg.sys.ip}}"
export CONCOURSE_POSTGRES_USER="{{pg.cfg.superuser_name}}"
export CONCOURSE_POSTGRES_PASSWORD="{{pg.cfg.superuser_password}}"
export CONCOURSE_POSTGRES_DATABASE="{{cfg.postgres.dbname}}"
{{/with}}
{{else ~}}
export CONCOURSE_POSTGRES_HOST="{{cfg.postgres.host_ip}}"
export CONCOURSE_POSTGRES_USER="{{cfg.postgres.username}}"
export CONCOURSE_POSTGRES_PASSWORD="{{cfg.postgres.password}}"
{{/if ~}}

export CONCOURSE_POSTGRES_DATABASE="{{cfg.postgres.dbname}}"