#!/usr/bin/python3.8
import sys
import logging
logging.basicConfig(stream=sys.stderr)
sys.path.insert(0,"/var/www/csDashboard/")

from csDashboard import app as application
application.secret_key = '0891426'
