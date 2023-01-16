python3 << EOF
# Imports Python modules to be used by the plugin.
import vim

def hello():
    print('Hello World")
EOF

function! vimstylo#stylohello()
	python3 hello()
endfunction	
