from __future__ import print_function
import sys
import subprocess
import re

# quick and dirty parsing

if len(sys.argv) < 2:
    sys.exit('Usage: fork fetch <fork>/push [force]')

command = sys.argv[1]
if command == 'fetch':
    if len(sys.argv) != 3:
        sys.exit('Usage: fork fetch <string from GH>')
    fork_name = sys.argv[2]
    user, branch = fork_name.split(':', 1)
else:
    if command != 'push':
        sys.exit('Usage: use fetch or push')
    force = sys.argv[2] == 'force' if len(sys.argv) > 2 else False
    output = subprocess.check_output('git rev-parse --abbrev-ref HEAD').decode('utf-8').strip()
    user, branch = output.split('/', 1)


output = subprocess.check_output('git remote show origin -n').decode('utf-8')
m = re.search(r'Fetch URL: git@github.com:.*/(.*).git', output)
if not m:
    sys.exit('Could not find Fetch URL in output:\n%s' % output)
repo_name = m.group(1)
print('Repo name:', repo_name)
local_branch = '{user}/{branch}'.format(user=user, branch=branch)

if command == 'fetch':
    subprocess.check_call('git fetch git@github.com:{user}/{repo_name} {branch}'.format(
        user=user, repo_name=repo_name, branch=branch))
    subprocess.check_call('git co -b {local_branch} FETCH_HEAD'.format(local_branch=local_branch))
    print('Created branch: {local_branch}'.format(local_branch=local_branch))
elif command == 'push':
    force_arg = '--force' if force else ''
    subprocess.check_call('git push git@github.com:{user}/{repo_name} {force_arg} {local_branch}:{branch}'.format(
        user=user, repo_name=repo_name, branch=branch, local_branch=local_branch, force_arg=force_arg))
else:
    assert 0

