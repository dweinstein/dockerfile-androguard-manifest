#!/usr/bin/env python2
from androguard.core.bytecodes.apk import *
import argparse

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='androguard manifest dumper tool')
    parser.add_argument('path', help='apk file path')
    args = parser.parse_args()
    a = APK(args.path)
    print a.get_android_manifest_xml().toprettyxml(newl='', encoding='utf-8')
