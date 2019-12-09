"""
Simple command-line for my fork-dealing needs.
"""
import argparse
import re
import sys
from collections import namedtuple
from subprocess import check_call, check_output

Slug = namedtuple('Slug', 'user branch local_branch')


def get_current_repo_name():
    output = check_output('git remote show origin -n').decode('utf-8')
    m = re.search(r'Fetch URL: git@github.com:.*/(.*).git', output)
    if not m:
        sys.exit('Could not find Fetch URL in output:\n%s' % output)
    return m.group(1)


def parse_slug(slug):
    user, branch = slug.split(':', 1)
    local_branch = f'{user}/{branch}'
    return Slug(user, branch, local_branch)


def get_current_slug():
    output = check_output('git rev-parse --abbrev-ref HEAD').decode('utf-8')
    slug = output.strip().replace('/', ':', 1)
    return parse_slug(slug)


def fetch(args):
    slug = parse_slug(args.slug)
    repo_name = get_current_repo_name()
    check_call(f'git fetch git@github.com:{slug.user}/{repo_name} {slug.branch}')
    check_call(f'git co -b {slug.local_branch} FETCH_HEAD')


def push(args):
    slug = get_current_slug()
    repo_name = get_current_repo_name()
    cmd = f'git push git@github.com:{slug.user}/{repo_name} {slug.local_branch}:{slug.branch}'
    if args.force:
        cmd += ' --force'
    check_call(cmd)


def clone(args):
    m = re.match(r'git@github.com:(.*)/(.*).git', args.url)
    if not m:
        print(f'Error matching {args.url}')
    owner, repo_name = m.groups()
    check_call(f'git clone git@github.com:nicoddemus/{repo_name}.git')
    check_call(f'git remote add upstream {args.url}', cwd=repo_name)
    check_call(f'git fetch --all', cwd=repo_name)


def main(argv):
    description = 'Simple command-line for my fork-dealing needs'
    parser = argparse.ArgumentParser(description=description)
    sub_parsers = parser.add_subparsers()

    description = 'Fetches a slug as a local branch'
    fetch_parser = sub_parsers.add_parser('fetch', description=description)
    fetch_parser.set_defaults(func=fetch)
    fetch_parser.add_argument('slug')

    description = 'Pushes a local branch in slug format back to upstream'
    push_parser = sub_parsers.add_parser('push', description=description)
    push_parser.set_defaults(func=push)
    push_parser.add_argument('--force', action="store_true", default=False)

    description = 'Clones an upstream URL, setting up origin and upstream remotes'
    fork_parser = sub_parsers.add_parser('clone', description=description)
    fork_parser.set_defaults(func=clone)
    fork_parser.add_argument('url')

    args = parser.parse_args(argv[1:])
    return args.func(args)


if __name__ == "__main__":
    sys.exit(main(sys.argv))
