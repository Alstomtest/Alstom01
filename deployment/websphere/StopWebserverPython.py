servers = [ 
    {'nodename':'node01',    'servername':'webserver1'}
]

execfile('wsadminlib.py')
  
webservers = listServersOfType('WEB_SERVER')
 
# stop application servers
for s in servers:
 
    if [s['nodename'], s['servername']] in webservers:
        print 'Stopping server ' + s['servername']
        stopWebServer(s['nodename'], s['servername'])
