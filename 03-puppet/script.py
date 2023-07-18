#!/bin/python3

import os.path
import os

path = "/opt/puppetlabs/puppet/cache/state/agent_catalog_run.lock"
file = os.path.isfile(path)

def script ():
    if file == True:
        os.system ("sudo rm /opt/puppetlabs/puppet/cache/state/agent_catalog_run.lock")
        os.system ("sudo /opt/puppetlabs/puppet/bin/puppet agent -t")
    else:
        print ("echo agent_catalog_run.lock does not exist")

if __name__ == "__main__":
    script()
