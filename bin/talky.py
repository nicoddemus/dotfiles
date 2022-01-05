"""
tAlK LiKe tHiS
"""
import sys

msg = " ".join(sys.argv[1:])
print("".join((x.upper() if i % 2 else x.lower()) for i, x in enumerate(msg)))
