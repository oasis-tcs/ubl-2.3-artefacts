# README

Members of the [Universal Business Language (UBL) TC](https://www.oasis-open.org/committees/ubl/) 
create and manage technical content in this TC GitHub repository (https://github.com/oasis-tcs/ubl-2.3-artefacts/) 
as part of the TC's chartered work (the program of work and deliverables described in its 
[charter](https://www.oasis-open.org/committees/ubl/charter.php).

OASIS TC GitHub repositories, as described in 
[GitHub Repositories for OASIS TC Members' Chartered Work](https://www.oasis-open.org/resources/tcadmin/github-repositories-for-oasis-tc-members-chartered-work), 
are governed by the OASIS [TC Process](https://www.oasis-open.org/policies-guidelines/tc-process), [IPR Policy](https://www.oasis-open.org/policies-guidelines/ipr), 
and other policies. While they make use of public GitHub repositories, these repositories are distinct from 
[OASIS Open Repositories](https://www.oasis-open.org/resources/open-repositories), which are used for 
development of open source [licensed](https://www.oasis-open.org/resources/open-repositories/licenses) 
content.

## 1. Description

The build process in this repository creates the suite of artefacts to be included with the hub document 
in the creation of the UBL 2.3 deliveries. The build process is triggered on every commit.

## 2. Contributions

As stated in this repository's 
[CONTRIBUTING](https://github.com/oasis-tcs/ubl-2.3-artefacts/blob/master/CONTRIBUTING.md) file, 
contributors to this repository must be Members of the OASIS UBL TC for any substantive contributions 
or change requests.  Anyone wishing to contribute to this GitHub project and 
[participate](https://www.oasis-open.org/join/participation-instructions) in the TC's technical 
activity is invited to join as an OASIS TC Member. Public feedback is also accepted, 
subject to the terms of the 
[OASIS Feedback License](https://www.oasis-open.org/policies-guidelines/ipr#appendixa). 

## 3. Licensing

Please see the [LICENSE](https://github.com/oasis-tcs/ubl-2.3-artefacts/blob/master/LICENSE.md) file 
for description of the license terms and OASIS policies applicable to the TC's work in this GitHub 
project. Content in this repository is intended to be part of the UBL TC's permanent record of activity, 
visible and freely available for all to use, subject to applicable OASIS policies, as presented in the 
repository [LICENSE](https://github.com/oasis-tcs/ubl-2.3-artefacts/blob/master/LICENSE.md). 

## 4. Further Description of this Repository

Distributions for UBL 2.0 through 2.3 have comprised two main collections of information, the documentation and the artefacts.

This repository is for the UBL 2.3 artefacts (See https://github.com/oasis-tcs/ubl-2.3-hub for the hub documentation):
- generation of document model information from UBL Google spreadsheets
  - genericode serialization
  - XSD schemas
  - JSON schemas
  - ODS and XLS spreadsheets
- other pre-created content
  - code lists
- other maintained content
  - validation examples
  - sample XML instance documents
- assembly of material into distributed arrangements
- generation of certain documentation components needed for publishing

The document models are downloaded directly from Google during the GitHub Action. The titles of the Google documents are irrelevant. Each document is referenced in the invocation script as follows:

`libGoogle=https://docs.google.com/spreadsheets/d/1bWAhvsb8..library.spreadsheet..iCMLhgUrHFzY`
- the URL of your Google spreadsheet for the common library (be sure not to include the "/edit..." at the end of the browser bar)

`docGoogle=https://docs.google.com/spreadsheets/d/1P-3yEI0..documents.spreadsheet..0NTmINxksPQ`
- the URL of your Google spreadsheet for the documents (be sure not to include the "/edit..." at the end of the browser bar)

`sigGoogle=https://docs.google.com/spreadsheets/d/1bWAhvsb8..signature.spreadsheet..hgUrHoiCML`
- the URL of your Google spreadsheet for the common library (be sure not to include the "/edit..." at the end of the browser bar)

The [`produceUBLSchemas-github.sh`](produceUBLSchemas-github.sh) invocation points to the particular set of parameters to use to create the artefacts. Two examples included in this repositories are the intermediate work submitted by the UBL Transportation Subcommittee (TSC) [`produceUBLSchemas-TSC-2.3.sh`](produceUBLSchemas-TSC-2.3.sh) and the CSPRD03 voting artefacts [`produceUBLSchemas-2.3.sh`](produceUBLSchemas-2.3.sh).

Every git push to the repository triggers the GitHub Action execution of [`produceUBLSchemas-github.sh`](produceUBLSchemas-github.sh) to invoke whichever set of results is needed. The action takes about 30 minutes of processing on GitHub to create all of the artefacts. This can be cut to about 20 minutes by skipping the generation of the many individual HTML report files and only generating the one summary HTML file. This skipping is signalled by the presence of the `skip-html.txt` file in the repository. When that file does not exist, all of the individual HTML reports are created. Skipping the individual HTML reports cuts this to about 20 minutes of processing.

If you are changing the Google spreadsheet but not any of your repository files, you cannot do a git push until you create a temporary file in your directory and then push the temporary file to the repository. The next time around, you can delete the temporary file in your directory and then push the deletion to the repository. Either of these steps will trigger GitHub actions that will reach out to the Google spreadsheet and run the process.

Two examples of the use of temporary files in a shell script are:
- `touch trigger.txt` - creates the temporary file
- `rm trigger.txt` - deletes the temporary file

Two examples of the use of temporary files in a DOS script are:
- `echo >trigger.txt` - creates the temporary file
- `del trigger.txt` - deletes the temporary file

To determine if the files are ready for sending to the project editors, look in the results in the `archive-only-not-in-final-distribution` directory for these files summarizing any problems with the submission:
- `artefacts.exitcode.{label}.txt` - exit code from the execution of the Ant build script
- `artefacts.console.{label}.txt` - console log of the execution of the Ant build script
- `check-ubl-2.3-github-ubl-2.3-csd03.html` - report of differences UBL 2.3 CSD04 to CSD03
- `check-ubl-2.3-github-ubl-2.2.html` - report of differences UBL 2.3 CSPRD03 to UBL 2.2

If there are no errors then the XSD schemas, JSON schemas, and HTML reports all will be generated and found in the ZIP file for your use in testing.

## 5. Preparing revision information

Each revision is described by the following configuration files:
- target identification when converting ODS to genericode
  - [`ident-UBL.xml`]( ident-UBL.xml ) 
  - [`ident-UBL-Signature.xml`]( ident-UBL-Signature.xml )
- XSD and JSON schema configuration
  - [`config-UBL.xml`]( config-UBL.xml )
    - IMPORTANT NOTE: there is version information in a comment at the top of this configuration file that, when changed, must be manually added to comments in the eight `UBL-*.xsd` XSD schema fragments found in the directory [`raw/xsd/common`]( raw/xsd/common )
    - `  Library:           OASIS Universal Business Language (UBL) 2.3 *STAGE-UPPER-CASE*`
    - `                     http://docs.oasis-open.org/ubl/*stage-lower-case*-UBL-2.3/`
    - `  Release Date:      *DATE*`
  - [`config-UBL-Signature.xml`]( config-UBL-Signature.xml )
    - IMPORTANT NOTE: this file has the same version information as found in `config-UBL.xml` that needs to be updated as required
- CVA master file for code list second-pass validation
  - [`UBL-CVA-Skeleton.cva`]( UBL-CVA-Skeleton.cva )
- shell wrapper for generated CVA Schematron pattern
  - [`UBL-DefaultDTQ-shell.sch`]( UBL-DefaultDTQ-shell.sch )
- spell-check word list (each line is a word not in the dictionary that is allowed to be in UBL, including misspellings from previous versions of UBL that cannot be repaired due to backward compatibility)
  - [`spellcheck-UBL.txt`]( spellcheck-UBL.txt )
- Google bug-avoidance model name massage directives
  - [`massageModelName.xml`]( massageModelName.xml )
- documentary ODS template skeleton for generating spreadsheet results
  - [`skeletonDisplayEditSubset.ods`]( skeletonDisplayEditSubset.ods )

Comparisons to old versions of UBL are generated as DocBook files for inclusion in the hub document. These old versions are the final genericode models for the particular version being compared. They have to be retrieved from the previous distribution and renamed to have their stage added to the name. So, for UBL 2.3 cs01 the comparisons are to:
- [`UBL-Entities-2.3-csd04.gc`]( UBL-Entities-2.3-csd04.gc )
- [`UBL-Signature-Entities-2.3-csd04.gc`]( UBL-Signature-Entities-2.3-csd04.gc )
- [`UBL-Entities-2.2.gc`]( UBL-Entities-2.2.gc )
- [`UBL-Signature-Entities-2.2.gc`]( UBL-Signature-Entities-2.2.gc )

Before the process runs, the spreadsheets on Google should reflect the new stage string in the spreadsheet name. Examples:
- UBL 2.3 Library Elements Spreadsheet - CS01 master
- UBL 2.3 Document Elements Spreadsheet - CS01 master

Installed software requirements invoked from Ant script using `exec`:
- `soffice` - LibreOffice, OpenOffice, or equivalent
- `aspell` - spell checker
- `sh`, `tee`, `wc`, `grep`, `sed` - typical POSIX applications

Subdirectories:
- [`os-UBL-2.0`]( os-UBL-2.0 ) - code list subdirectory copied from released version of UBL 2.0
- [`os-UBL-2.1`]( os-UBL-2.1 ) - code list subdirectory copied from released version of UBL 2.1
- [`os-UBL-2.2`]( os-UBL-2.2 ) - code list subdirectory copied from released version of UBL 2.2
- [`raw`]( raw ) - pre-populated content of the results directory with skeleton contents
  - [`raw/cl`]( raw/cl ) - code list content from having run the code list tooling and results here:
    - https://www.oasis-open.org/committees/document.php?document\_id=67039 - tooling
    - https://www.oasis-open.org/committees/document.php?document\_id=67038 - results
    - the `master-code-list-UBL-*.xml` file records the input information to the code list generation 
  - [`raw/json`]( raw/json ) - sample JSON instances converted from the sample XML instances
  - [`raw/json-schema`]( raw/json-schema ) - hand-authored JSON Schema fragments
  - [`raw/mod`]( raw/mod ) - hand-authored model documentation fragments
  - [`raw/val`]( raw/val ) - demonstration validation environment and validation of the XML samples
  - [`raw/xml`]( raw/xml ) - sample XML instances
  - [`raw/xsd`]( raw/xsd ) - hand-authored XML Schema fragments
- [`utilities`]( utilities ) - tools used to generate outputs

## 6. Results

Outputs:
- document model spreadsheets as downloaded from Google
  - `UBL-Documents-Google.ods`
  - `UBL-Library-Google.ods`
  - `UBL-Signature-Google.ods`
- model check of naming and design rules against previous release of 2.3 and against 2.2
  - `check-ubl-2.3-*-ubl-2.3-csd04.html`
  - `check-ubl-2.3-*-ubl-2.2.html`
- model check of naming and design rules for the signature extension
  - `check-ubl-signature-2.3-*.html`
- differences between versions of document models expressed as DocBook for inclusion in the hub document
  - `old2newDocBook-UBL-2.3-*-UBL-2.3-csd04-documents-ent.xml`
  - `old2newDocBook-UBL-2.3-*-UBL-2.3-csd04-library-ent.xml`
  - `old2newDocBook-UBL-2.3-*-UBL-2.2-documents-ent.xml`
  - `old2newDocBook-UBL-2.3-*-UBL-2.2-library-ent.xml`
  - `old2newDocBook-UBL-Signature-documents-ent.xml`
  - `old2newDocBook-UBL-Signature-library-ent.xml`
- summary use of words in Dictionary Entry Names (each line is the word followed by the version of UBL in which the word is used)
  - `wordlist-UBL.txt`
- diagnostic list of DEN words not found in the dictionaries or spell check supplement (should be empty)
  - `unexpectedWords.txt`
- conversion of Google to genericode and of genericode to ODS and from ODS to XLS
  - `mod/UBL-Entities-2.3.gc`
  - `mod/UBL-Entities-2.3.ods`
  - `mod/UBL-Entities-2.3.xls`
  - `mod/UBL-Signature-Entities-2.3.gc`
  - `mod/UBL-Signature-Entities-2.3.ods`
  - `mod/UBL-Signature-Entities-2.3.xls`
- generated documentation of all of the document models
  - `mod/summary/reports/All-UBL-2.3-Documents.html`
  - `mod/summary/reports/*.html` - when not skipping the generation of the individual HTML reports
- generated OASIS Context/Value Association expression of code list validation and its documentation
  - `cva/UBL-DefaultDTQ-2.3.cva`
  - `cva/UBL-DefaultDTQ-2.3.html`
- generated complete suite of XML schemas (combined with authored fragments)
  - `xsd/`
- generated runtime copy of XML schemas (no annotations in the generated fragments)
  - `xsdrt/`

Various warning and error files are created in the base output directory indicating issues regarding the build process:
 - `NDR-SPELL-ChECK-WARNING.txt` - see the `unexpetedWords.txt` for a list of words that are not found in English or the UBL dictionary
 - `UNEXPECTED-SAMPLES-NS-PI-DETAILS.txt` - open the file to see a list of unexpected namespace declarations found in sample files
 - `MISMATCHED-TEST-SAMPLES-SH-WARNING.txt` - the number of invocations in the `val/testsamples.sh` script does not match the number of examples
 - `MISMATCHED-TEST-SAMPLES-BAT-WARNING.txt` - the number of invocations in the `val/testsamples.bat` script does not match the number of examples
 - `UNEXPECTED-TEST-RESULT-WARNING.txt` - the `val/test.sh` script did not end cleanly
 - `UNEXPECTED-TEST-SAMPLES-RESULT-WARNING.txt` - at least one invocation in the `val/testsamples.sh` did not validate 
 - `LIST-OF-PROBLEM-CODE-LISTS.txt` - genericode files in the `cl/` directory that are not genericode-schema valid

When git runs the build process these invocation arguments are used to build everything (no timestamp checking on github):
- `sh produceUBLSchemas-github.sh target github CCyymmdd-HHMMz`

The build result (after about 30 minutes on GitHub) in the target directory:
- `artefacts-UBL-2.3-{stage}-{label}/` - distribution artefacts
- `artefacts-UBL-2.3-{stage}-{label}/archive-only-not-in-final-distribution/` - archive artefacts

Note that in the archive directory are the files:
- `artefacts.console.{label}.txt` - console log of the execution of the Ant build script
- `artefacts.exitcode.{label}.txt` - exit code from the execution of the Ant build script

## 7. Housekeeping

The return ZIP file is doubly-zipped, once on the web site to reduce storage costs (300Mb down to 30Mb), and once by GitHub to return the artefacts from the server. Once downloaded, please delete the download artefact off of GitHub to reduce storage costs.

## 8. Offline use for production purposes by project editors

The use of GitHub Actions is suitable for development and also as a first step for creating the final distribution. See the hub documentation [readme](https://github.com/oasis-tcs/ubl-2.3-hub#readme) regarding the steps to take after completing the GitHub action for the artefacts. Hub document creation performs integrity checks regarding missing artefact files referenced from the hub document XML.

This artefacts-production process is performed first, followed by the hub-production process.

### 8.1 Prepare configuration, identification, and invocation files

These offline steps presume that the configuration and identification files in the repository already have been updated to the current stage information from having tested the generation of artefacts on GitHub Actions. See above "Preparing revision information".

Also ensure that the invocation file `produce-UBL-schemas-2.3.sh` also has been updated with the appropriate revision information.

### 8.2 Prepare raw static schema files

There are eight schema fragments named `raw/xsd/common/U*.xsd` and the same three lines in each of the files must be manually edited to match the same three lines found in the configuration files. The configuration files are used for generated files but the static files must be manually edited.

### 8.3 Establish the label to use for the build process

This label is used to identify the result of the build process. It can be as simple as "`test`" for intermediate results. For final distribution results it is a UTC date/time (Zulu time zone) and takes the format: `CCYYMMDD-HHMMz`

For the integrity checking process to work properly, the same label needs to be used when creating the artefacts and then later when creating the hub document. GitHub uses its own real-time label and so the hub document [readme](https://github.com/oasis-tcs/ubl-2.3-hub#readme) file has instructions regarding renaming this file appropriately.

### 8.4 When preparing the artefacts locally

The process presumes that the local copies of both the repositories for `ubl-2.3-artefacts` and `ubl-2.3-hub` have the same parent directory. By convention, in the following step use the subdirectory name `results` that will become a sibling to the two repository directories. Any name can be used, but the examples that follow assume `results/` is to be created.

From the local artefacts repository directory, run the production process indicating the `local` platform and the label to be used also when generating the hub document:

- `sh produceUBLSchemas-2.3.sh ../results {platform} {label}`
- `sh produceUBLSchemas-2.3.sh ../results local test`
- `sh produceUBLSchemas-2.3.sh ../results local 20200511-1720z`

When successful, continue with offline hub document production as documented in https://github.com/oasis-tcs/ubl-2.3-hub#readme

## Contact

Please send questions or comments about 
[OASIS TC GitHub repositories](https://www.oasis-open.org/resources/tcadmin/github-repositories-for-oasis-tc-members-chartered-work) 
to the [OASIS TC Administrator](mailto:tc-admin@oasis-open.org).  For questions about content in this 
repository, please contact the TC Chair or Co-Chairs as listed on the the UBL TC's 
[home page](https://www.oasis-open.org/committees/ubl/).
