servers = [ 
    {'nodename':'node01',    'servername':'webserver1'}, 
    {'nodename':'node01',    'servername':'MXServer'}
]

execfile('wsadminlib.py')
  
webservers = listServersOfType('WEB_SERVER')
 
# start application servers
for i in range(0,5):
    try:
    # restarting servers
        for s in servers:
            if [s['nodename'], s['servername']] not in webservers:
                print 'Starting server ' + s['servername'] + ' attempt ' + str(i)
                startServer(s['nodename'], s['servername'])
    except Exception:
        continue
    break
