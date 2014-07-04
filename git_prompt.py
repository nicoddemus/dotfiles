import os
import sys
import subprocess
import re


def check_output(params):
    if isinstance(params, str):
        params = params.split()
    popen = subprocess.Popen(params, shell=True, stderr=subprocess.STDOUT,
                             stdout=subprocess.PIPE)

    output, _ = popen.communicate()
    returncode = popen.poll()
    return output.decode('ascii').strip(), returncode



def parse_status(output):
    ahead_re = re.compile(r'ahead (\d+)')
    behind_re = re.compile(r'behind (\d+)')
    branch_re = re.compile(r'## ([\d\w\_-]+)')

    def get_group(regex, line, default):
        m = regex.search(line)
        return m.group(1) if m else default
 
    branch = ''
    ahead, behind, modified, unknown = 0, 0, 0, 0    
    for line in output.splitlines():
        if line.startswith('?? '):
            unknown += 1
        elif line.startswith(' M'):
            modified += 1
        elif line.startswith('## '):
            branch = get_group(branch_re, line, '')
            ahead += int(get_group(ahead_re, line, 0))
            behind += int(get_group(behind_re, line, 0))
    
    return branch, ahead, behind, modified, unknown

output, returncode = check_output('git status --branch --porcelain')    

if returncode == 0:
    def pad(count, prefix, suffix=''):
        return ' %s%d%s' % (prefix, count, suffix) if count else ''

    branch, ahead, behind, modified, unknown = parse_status(output)
    sep = ' %bright_cyan%-' if (modified or unknown) else ''

    git_info = r' %yellow%[%bright_cyan%{branch}{ahead}{behind}{sep}{modified}{unknown}%yellow%]%normal%'.format(
       branch=branch,
       ahead=pad(ahead, '%green%'),
       behind=pad(behind, '%red%'),
       modified=pad(modified, '%red%', 'M'),
       unknown=pad(unknown, '%grey%', '?'),
       sep=sep,
    )
else:
    git_info = ''

sys.stdout.write('$P' + git_info + '>')
