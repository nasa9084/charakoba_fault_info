#!/usr/bin/env python
# -*- coding:utf-8 -*-

from bottle import Bottle, HTTPResponse, request, static_file
from bottle import jinja2_view as view
import json
import os
import api

configfile = os.path.join(os.path.dirname(__file__), 'config.json')
with open(configfile, 'r') as f:
    cfg = json.load(f)

application = Bottle()
get = application.get

application.mount('/api', api.application)


@get('/')
@view('statics/template/index.tpl')
def index():
    return {"infos": api.get_all_info()}


@get('/statics/<filename:path>')
def static(filename):
    root = os.path.join(os.path.dirname(__file__), 'statics')
    return static_file(filename, root=root)

if __name__ == '__main__':
    application.run(host='localhost', port=8080, debug=True, reloader=True)