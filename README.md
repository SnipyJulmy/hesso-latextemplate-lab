HEIA project report LaTeX template
==================================

A LaTeX template for HES-SO//Master Computer Science lab reports.

Authors:

- Sylvain Julmy <sylvain.julmy@master.hes-so.ch>
- Marc Demierre <marc.demierre@master.hes-so.ch>


Features
--------

* Nice title page with school logos and lab info
* Header and footer with lab information
* Code highlighting with minted
* Nice default typography settings (by default the template uses lmodern fonts, but you can easily change the fonts in the preamble if needed)


Dependencies and setup
----------------------

* A recent LaTeX distribution
* Python 2.7+ or 3+ and pygments (for the minted code highlighting package)

If you encounter issues, please make sure everything is in your `PATH`.

### Setup on OSX

* Install a LaTeX distribution, like MacTex (https://tug.org/mactex/). Make sure the bin directory is in your `PATH`.

* Upgrade your LaTeX distribution. With MacTex, this can be done using the built-in "TeXLive Utility" software.

* Python is provided by default on OSX (we recommend using homebrew to get the latest version though), you just need to install the pygments package:

        pip install pygments

### Setup on Windows

* Install a LaTeX distribution, like MiKTeX (http://miktex.org/). Make sure the bin directory is in your `PATH`.
* Install the biber package
* Install Python from https://www.python.org/downloads/windows/. Be sure to check the PATH option in the installer.
* Install the pygments package
        
        pip install pygments

### Setup on Linux

If you use Linux, you're used to not having precise instructions. Just do it!

More seriously, the only pain point is probably the old package versions if you use an inferior distribution whose repository has an old version of TeXLive. We recommend to install TexLive manually in this case, or to use Arch.


Getting started
---------------

* Install the dependencies
* Clone this repository where you want to place the report and delete the `.git` directory (The `getReport.sh` script does this for you)
* Write your report

### Using the command line

A Makefile is provided so you can just use `make` to build the PDF. A `make clean` command will delete all the pdflatex build files.
        
### Using the Texmaker IDE

* Use this configuration for the quick build:

        pdflatex -shell-escape -synctex=1 -interaction=nonstopmode %.tex|pdflatex -shell-escape -synctex=1 -interaction=nonstopmode %.tex


Contribute
----------

Do not hesitate to make a pull request if you have useful additions/corrections for this template. You can also post an issue if you find a bug or want to suggest an improvement.

License
-------

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