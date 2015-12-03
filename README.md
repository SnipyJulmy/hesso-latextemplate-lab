# HES-SO//Master Lab report LaTeX template

A LaTeX template for HES-SO//Master Computer Science lab reports.

Authors:

- Sylvain Julmy <sylvain.julmy@master.hes-so.ch>
- Marc Demierre <marc.demierre@master.hes-so.ch>

## Features

- Nice title page with school logos and lab info
- Header and footer with lab information
- Code highlighting with minted
- Nice default typography settings (by default the template uses lmodern fonts, but you can easily change the fonts in the preamble if needed)

## Dependencies and setup

### Dependencies

- A recent LaTeX distribution
- Python 2.7+ or 3+ and pygments (for the minted code highlighting package)

### Setup on OSX

1. Install a LaTeX distribution, like MacTex (https://tug.org/mactex/). Make sure the bin directory is in your `PATH`.

2. Upgrade your LaTeX distribution. With MacTex, this can be done using the built-in "TeXLive Utility" software.

3. Python is provided by default on OSX (we recommend using homebrew to get the latest version though), you just need to install the pygments package:

        pip install pygments

### Setup on Windows

1. Install a LaTeX distribution, like MiKTeX (http://miktex.org/). Make sure the bin directory is in your `PATH`.
2. Install the biber package
3. Install Python from https://www.python.org/downloads/windows/. Be sure to check the PATH option in the installer.
4. Install the pygments package

        pip install pygments

### Setup on Linux

If you use Linux, you're used to not having precise instructions. Just do it!

More seriously, the only pain point is probably the old package versions if you use an inferior distribution whose repository has an old version of TeXLive. We recommend to install TexLive manually in this case, or to use Arch.

## Getting started

### General steps

1. Install the dependencies (see previous section)
2. Clone this repository where you want to place the report and delete the `.git` directory (The `getReport.sh` script does this for you)
3. Write your report
4. Build the PDF (see below)

### Building using the command line

A Makefile is provided so you can just use `make` to build the PDF. A `make clean` command will delete all the pdflatex build files.

### Building using the Texmaker IDE

Use this configuration for the quick build:

    pdflatex -shell-escape -synctex=1 -interaction=nonstopmode %.tex|pdflatex -shell-escape -synctex=1 -interaction=nonstopmode %.tex

## Contributing

Do not hesitate to make a pull request if you have useful additions/corrections for this template. You can also post an issue if you find a bug or want to suggest an improvement.

The followin contributions would be welcome:

- Separation in several files:
    * `preamble.tex`: package imports and configuration
    * `metadata.tex`: lab information (Course name, students, ...)
    * `report_base.tex`: title page and content
- Improvements to `getReport.sh`
    * (depends on the above change) Automatic population of the `metadata.tex` file from command line arguments in `getReport.sh`
    * Change logic to use local repo instead of github (to avoid problems when local repo is not in sync)

## License

    Copyright 2015 Marc Demierre, Sylvain Julmy

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
