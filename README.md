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

## Description


The build process in this repository creates the suite of artefacts to be included with the hub document 
in the creation of the UBL 2.3 deliveries. The build process is triggered on every commit.

## Contributions

As stated in this repository's 
[CONTRIBUTING](https://github.com/oasis-tcs/ubl-2.3-artefacts/blob/master/CONTRIBUTING.md) file, 
contributors to this repository must be Members of the OASIS UBL TC for any substantive contributions 
or change requests.  Anyone wishing to contribute to this GitHub project and 
[participate](https://www.oasis-open.org/join/participation-instructions) in the TC's technical 
activity is invited to join as an OASIS TC Member. Public feedback is also accepted, 
subject to the terms of the 
[OASIS Feedback License](https://www.oasis-open.org/policies-guidelines/ipr#appendixa). 

## Licensing

Please see the [LICENSE](https://github.com/oasis-tcs/ubl-2.3-artefacts/blob/master/LICENSE.md) file 
for description of the license terms and OASIS policies applicable to the TC's work in this GitHub 
project. Content in this repository is intended to be part of the UBL TC's permanent record of activity, 
visible and freely available for all to use, subject to applicable OASIS policies, as presented in the 
repository [LICENSE](https://github.com/oasis-tcs/ubl-2.3-artefacts/blob/master/LICENSE.md). 

## Further Description of this Repository

Distributions for UBL 2.0 through 2.3 have comprised two main collections of information, the documentation and the artefacts.

This repository is for the artefacts:
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

See https://github.com/oasis-tcs/ubl-2.3-hub for the hub documentation.

The document models in ODF-ODS format being processed into results are downloaded from Google _(note that the ODF-ODS files from Microsoft Word or from OpenOffice are bloated and the generation process is slowed by a factor of sometimes up to 10; even if you have maintained the ODS files offline from Google, it will speed the generation process if you take the time to upload them to Google, convert them into a Google spreadsheet, and then download the Google spreadsheet as an ODS file)_:
- [`UBL-Documents-Google.ods`]( UBL-Documents-Google.ods )
- [`UBL-Library-Google.ods`]( UBL-Library-Google.ods )
- [`UBL-Signature-Google.ods`]( UBL-Signature-Google.ods )

The document model genericode files are generated from the ODS files, preserved in this Git repository for archived reference, and copied to the results directory:
- [`UBL-Entities-2.3.gc`]( UBL-Entities-2.3.gc )
- [`UBL-Signature-Entities-2.3.gc`]( UBL-Signature-Entities-2.3.gc )

Each revision is described by the following configuration files:
- target identification when converting ODS to genericode
  - [`ident-UBL.xml`]( ident-UBL.xml ) 
  - [`ident-UBL-Signature.xml`]( ident-UBL-Signature.xml )
- XSD and JSON schema configuration
  - [`config-UBL.xml`]( config-UBL.xml )
    - IMPORTANT NOTE: there is version information in a comment at the top of this configuration file that, when changed, must be manually added to comments in the eight `UBL-*.xsd` XSD schema fragments found in the directory [`raw/xsd/common`]( raw/xsd/common )
    - `  Library:           OASIS Universal Business Language (UBL) 2.3 *VERSION*`
    - `                     http://docs.oasis-open.org/ubl/*VERSION*-UBL-2.3/`
    - `  Release Date:      *DATE*`
  - [`config-UBL-Signature.xml`]( config-UBL-Signature.xml )
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

Comparisons to old versions of UBL are generated as DocBook files for inclusion in the hub document. These old versions are the final genericode models for the particular version being compared. So, for UBL 2.3 csprd03 the comparisons are to:
- [`UBL-Entities-2.3-csprd02.gc`]( UBL-Entities-2.3-csprd02.gc )
- [`UBL-Signature-Entities-2.3-csprd02.gc`]( UBL-Signature-Entities-2.3-csprd02.gc )
- [`UBL-Entities-2.2.gc`]( UBL-Entities-2.2.gc )
- [`UBL-Signature-Entities-2.2.gc`]( UBL-Signature-Entities-2.2.gc )

Outputs:
- model check of naming and design rules against previous release of 2.3 and against 2.2
  - `check-ubl-2.3-*-ubl-2.3-csprd02.html`
  - `check-ubl-2.3-*-ubl-2.2.html`
- model check of naming and design rules for the signature extension
  - `check-ubl-signature-2.3-*.html`
- differences between versions of document models expressed as DocBook for inclusion in the hub document
  - `old2newDocBook-UBL-2.3-*-UBL-2.3-csprd02-documents.xml`
  - `old2newDocBook-UBL-2.3-*-UBL-2.2-library.xml`
- summary use of words in Dictionary Entry Names (each line is the word followed by the version of UBL in which the word is used)
  - `wordlist-UBL.txt`
- diagnostic list of DEN words not found in the dictionaries or spell check supplement (should be empty)
  - `unexpectedWords.txt`
- conversion of genericode to ODS and from ODS to XLS
  - `mod/UBL-Entities-2.3.ods`
  - `mod/UBL-Entities-2.3.xls`
  - `mod/UBL-Signature-Entities-2.3.ods`
  - `mod/UBL-Signature-Entities-2.3.xls`
- generated documentation of all of the document models
  - `mod/summary/reports/`
- generated OASIS Context/Value Association expression of code list validation and its documentation
  - `cva/UBL-DefaultDTQ-2.3.cva`
  - `cva/UBL-DefaultDTQ-2.3.html`
- generated complete suite of XML schemas (combined with authored fragments)
  - `xsd/`
- generated runtime copy of XML schemas (no annotations in the generated fragments)
  - `xsdrt/`

The build process runs the [`produceUBLschemas.xml`]( produceUBLschemas.xml ) Ant script and is invoked as follows when running offline (using timestamp checking for selective building) and not on git:
- `sh produceUBLSchemas-2.3.sh ../results stage label`
  - pre-existing target directory (without trailing "/")
  - stage (e.g. "csd02wd03", "csprd01", "os", etc.; note that the stage "github" is for interim use and triggers on GitHub a build of everything without checking timestamps)
  - label (e.g. "CCyymmdd-HHMMz" UTC time as in "20200406-1450z")

When git runs the build process these invocation arguments are used to build everything (no timestamp checking on github):
- `sh produceUBLSchemas-2.3.sh target github CCyymmdd-HHMMz`

Note that because the stage variable is used in the naming of files, the final work product cannot be built using git. Only interim test work products can be built using git. The final work product must be made offline using the appropriate stage string value.

The build result in the target directory:
- `artefacts-UBL-2.3-{stage}-{label}/` - distribution artefacts
- `artefacts-UBL-2.3-{stage}-{label}/archive-only-not-in-final-distribution/` - archive artefacts

Note that in the archive directory is the file `console.{label}.txt` with the console log of the execution of the Ant build script.

## Contact

Please send questions or comments about 
[OASIS TC GitHub repositories](https://www.oasis-open.org/resources/tcadmin/github-repositories-for-oasis-tc-members-chartered-work) 
to the [OASIS TC Administrator](mailto:tc-admin@oasis-open.org).  For questions about content in this 
repository, please contact the TC Chair or Co-Chairs as listed on the the UBL TC's 
[home page](https://www.oasis-open.org/committees/ubl/).
