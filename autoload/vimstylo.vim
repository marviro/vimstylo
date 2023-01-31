let g:plugin_path = expand('<sfile>:p:h')

python3 << EOF
# imports python modules to be used by the plugin.
import vim
import requests
import json

import os
import sys
import vim

plugin_path = vim.eval("g:plugin_path")
python_module_path = os.path.abspath('%s/../pyapp' % (plugin_path))
sys.path.append(python_module_path)

import settings
import app


accessToken = settings.accessToken

def stylohello(filename):
    print("Hello World "+filename)

def insertmd():
    text = "test"
    vim.current.buffer.append(text)

def insertmd2():
    text = "test"
    vim.command("normal i"+text)
    vim.command("normal ggVGsLala")

def insertmd3():
    montexte = vim.eval("a:arg1")	
    text = montexte
    vim.command("normal i"+text)

def insertmdfromwv():    
    artid = vim.eval("a:arg1")	
    variables={"id":artid}

    text= app.styloquery(app.getwvmd, variables)['data']['article']['workingVersion']['md']
    vim.command("normal i"+text)
EOF

function! vimstylo#stylohello()
	let filename = expand('%:p')
	python3 stylohello(vim.eval('filename'))
endfunction	

function! vimstylo#insertmd()
	python3 insertmd()
endfunction	

function! vimstylo#insertmd2()
	python3 insertmd2()
endfunction	

function! vimstylo#insertmd3(arg1)
	python3 insertmd3()
endfunction	
function! vimstylo#insertmdfromwv(arg1)
	python3 insertmdfromwv()
endfunction	
