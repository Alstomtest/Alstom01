servers = [ 
    {'nodename':'node01',    'servername':'webserver1'}
]

execfile('wsadminlib.py')
  
webservers = listServersOfType('WEB_SERVER')
 
# restarting servers
for s in servers:
 
    if [s['nodename'], s['servername']] in webservers:
        print 'Starting server ' + s['servername']
        startWebServer(s['nodename'], s['servername'])
 