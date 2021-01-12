servers = [ 
    {'nodename':'node01',    'servername':'webserver1'}, 
    {'nodename':'node01',    'servername':'MXServer'}
]

execfile('wsadminlib.py')
  
webservers = listServersOfType('WEB_SERVER')
 
for i in range(0,5):
    try:
        # stop application servers
        for s in servers:
            if [s['nodename'], s['servername']] not in webservers:
                print 'Stopping server ' + s['servername'] + ' attempt '+str(i)
                stopServer(s['nodename'], s['servername'])

    except Exception:
        continue
    break
