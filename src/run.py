#!/bin/python3
import subprocess
import argparse

parser = argparse.ArgumentParser()
parser.add_argument("path", nargs=1, default=".")
parser.add_argument("--vm-type", choices=["chroot","kvm","qemu"], default="kvm")
parser.add_argument("--dist", default="sl15.6")
args = parser.parse_args()

cmd = "pbuild"
cmd = cmd + f" --dist \"{args.dist}\""
cmd = cmd + f" --vm-type \"{args.vm_type}\""
cmd = cmd + f" {args.path[0]} "

print(f"running command: {cmd}")

subprocess.run(cmd, check=True, shell=True)
