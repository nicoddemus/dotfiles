import subprocess


tag = subprocess.check_output('git describe --abbrev=0 --tags').strip().decode('utf-8')
authors = subprocess.check_output('git log {}..HEAD --format=%aN'.format(tag)).decode('utf-8').splitlines()
for author in sorted(set(authors)):
    print('* {}'.format(author))

