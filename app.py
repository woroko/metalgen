from bottle import Bottle, run, \
     template, debug, static_file, request

import os, sys
from inspect import getsourcefile
from os.path import abspath

import re
from generator import Sampler

from gevent import pywsgi
from gevent import monkey; monkey.patch_all()


dirname = os.path.dirname(abspath(getsourcefile(lambda:0)))

app = Bottle()
debug(True)

metalSampler = Sampler("model.mod")

@app.route('/static/<filepath:path>')
def server_static(filepath):
    print("test23")
    return static_file(filepath, root=dirname+'/static/asset')
'''
@app.route('/static/<filename:re:.*\.css>')
def send_css(filename):
    #print(str(dirname)+'/static/asset/css')
    return static_file(filename, root=dirname+'/static/asset/css')

@app.route('/static/<filename:re:.*\.js>')
def send_js(filename):
    return static_file(filename, root=dirname+'/static/asset/js')

@app.route('/static/<filename:re:.*\.mp4>')
def send_mp4(filename):
    return static_file(filename, root=dirname+'/static/asset/images')

@app.route('/static/<filename:re:.*\.jpg>')
def send_jpg(filename):
    return static_file(filename, root=dirname+'/static/asset/images')

@app.route('/static/<filename:re:.*\.png>')
def send_png(filename):
    return static_file(filename, root=dirname+'/static/asset/images')
'''


@app.route('/')
def splash():
    data = {"developer_name":"User",
            "developer_organization":"Inference"}
    return template('splash', data = data)

@app.route('/generate')
def index():
    data = {"developer_name":"User",
            "developer_organization":"Inference"}
    return template('index', data = data)

@app.route('/ajax/loadlyrics', method='POST')
def lyrics():
    genre = int(request.forms.get('genre'))
    if (genre == 1):
        lyrics = metalSampler.sample(50, 5)
        lyrics = lyrics.replace('<s>', '<br><br>')
        lyrics = lyrics.replace('</s>', '')
        lyrics = lyrics.replace('<brk>', '<br>')
        lyrics = re.sub('[\n ]?<br>[\n ]?<br>[\n ]?<br>[\n ]?', '<br><br>', lyrics)

        lyrics = "<div class=\"row\">\n" + lyrics + "\n</div>"
        data = {"lyrics":lyrics}
    else:
        data = {"lyrics":"Only metal lyrics are supported in this version."}
    #ret =
    return template('lyrics', data = data)


monkey.patch_all()
run(app, host='localhost', port=8080, server='gevent')
