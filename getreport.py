#!/usr/bin/python3

import os
import sys
import shutil
import argparse

# -- Configuration
MODEL_DIR = 'report'
MODEL_REPORT_FILE = 'report.tex'
MODEL_METADATA_FILE = 'metadata.tex'

REPORT_NAME = 'report'
REPORT_DIR = 'report'

def parse_args():
    """
    Parses the command line arguments.
    :return: metadata
    """

    # -- Configure argument parser
    parser = argparse.ArgumentParser(description='Create and configure a HES-SO//Master lab report')
    parser.add_argument(
        'report_path',
        type=str,
        help='path to the report directory to create (must not exist)'
    )
    parser.add_argument(
        '-n',
        '--name',
        type=str,
        default=REPORT_NAME,
        help='name of your report file (without .tex extension)'
    )
    parser.add_argument(
        '-t',
        '--title',
        type=str,
        help='report title'
    )
    parser.add_argument(
        '-c',
        '--course',
        type=str,
        help='course name'
    )
    parser.add_argument(
        '-a',
        '--author',
        action='append',
        help='author name (can be repeated for multiple auhors)'
    )
    parser.add_argument(
        '-s',
        '--supervisor',
        action='append',
        help='supervisor name (can be repeated for multiple supervisors)'
    )

    # -- Parse arguments
    args = parser.parse_args()

    # -- Build params dict from arguments
    params = {
        'report_path': args.report_path,
        'report_name': args.name,

        'metadata': {
            'title': args.title,
            'course': args.course,
            'authors': args.author,
            'supervisors': args.supervisor
        }
    }
    return params


def setup_metadata(destination_dir, metadata):
    # -- Get metadata latex code
    contents = None
    with open(os.path.join(destination_dir, MODEL_METADATA_FILE), 'r') as file:
        contents = file.read()

    # -- Replace variables
    if metadata['course']:
        contents = contents.replace('<Course>', metadata['course'])

    if metadata['title']:
        contents = contents.replace('<Title>', metadata['title'])

    if metadata['authors']:
        authors = "\\\\".join(metadata['authors'])
        contents = contents.replace('<Authors>', authors)

    if metadata['supervisors']:
        supervisors = "\\\\".join(metadata['supervisors'])
        contents = contents.replace('<Supervisors>', supervisors)

    # -- Create metadata file
    with open(os.path.join(destination_dir, MODEL_METADATA_FILE), 'w') as file:
        file.write(contents)

    return 0


def setup_makefile(destination_dir, report_name):
    # -- Get makefile contents
    contents = None
    with open(os.path.join(destination_dir, "Makefile"), 'r') as file:
        contents = file.read()

    # -- Replace contents
    contents = contents.replace(
        'report.pdf',
        "{}.pdf".format(report_name)
    )
    contents = contents.replace(
        'report.tex',
        "{}.tex".format(report_name)
    )

    # -- Write Makefile
    with open(os.path.join(destination_dir, "Makefile"), 'w') as file:
        file.write(contents)

    return 0


def setup_gitignore(destination_dir, report_name):
    # -- Get makefile contents
    contents = None
    with open(os.path.join(destination_dir, ".gitignore"), 'r') as file:
        contents = file.read()

    # -- Replace contents
    contents = contents.replace(
        'report.pdf',
        "{}.pdf".format(report_name)
    )

    # -- Write Makefile
    with open(os.path.join(destination_dir, ".gitignore"), 'w') as file:
        file.write(contents)

    return 0


def main():
    # -- Parse command-line arguments
    params = parse_args()
    print("Parameters: " + str(params))

    # -- Get directories
    model_dir = os.path.join(os.path.dirname(os.path.realpath(sys.argv[0])), REPORT_DIR)
    destination_dir = params['report_path']
    print("Model directory: {}".format(model_dir))
    print("Destination directory: {}". format(destination_dir))

    # -- Copy report files and rename main tex file
    shutil.copytree(model_dir, destination_dir)
    os.rename(
        os.path.join(destination_dir, MODEL_REPORT_FILE),
        os.path.join(destination_dir, params['report_name'] + ".tex")
    )

    # -- Configure report files
    setup_metadata(destination_dir, params['metadata'])
    setup_makefile(destination_dir, params['report_name'])
    setup_gitignore(destination_dir, params['report_name'])

    return 0

if __name__ == '__main__':
    main()
