# -*- coding: utf-8 -*-
# vim: ft=sls
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import salt_settings with context %}
{%- if grains['os']|lower not in ('amazon', 'fedora') %}

salt-pkgrepo-install-saltstack-redhat:
  pkgrepo.managed:
    - name: {{ salt_settings.pkgrepo_name }}
    - humanname: {{ salt_settings.pkgrepo_humanname }}
    - baseurl: {{ salt_settings.pkgrepo }}
    - enabled: 1
    - gpgcheck: 1
    - gpgkey: {{ salt_settings.key_url }}
{% endif %}
