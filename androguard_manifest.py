from androguard.core.bytecodes.apk import *
import argparse

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='ios-static analysis tool')
    parser.add_argument('path', help='apk file path')
    args = parser.parse_args()
    a = APK(args.path)
    print a.get_android_manifest_xml().toprettyxml()
