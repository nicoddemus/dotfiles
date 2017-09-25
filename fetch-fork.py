from __future__ import print_function
import sys
import subprocess
import re

if len(sys.argv) != 2:
    sys.exit('Usage: fetch-fork <fork string from GH>')

fork_name = 'maiksensi:feat/raise-not-implemented-for-lt-gt-in-approx'
fork_name = sys.argv[1]

user, branch = fork_name.split(':', 1)

output = subprocess.check_output('git remote show origin -n').decode('utf-8')
m = re.search(r'Fetch URL: git@github.com:.*/(.*).git', output)
if not m:
    sys.exit('Could not find Fetch URL in output:\n%s' % output)
repo_name = m.group(1)
print('Repo name:', repo_name)
subprocess.check_call('git fetch git@github.com:{user}/{repo_name} {branch}'.format(
    user=user, repo_name=repo_name, branch=branch))
subprocess.check_call('git co -b {user}/{branch} FETCH_HEAD'.format(user=user, branch=branch))
