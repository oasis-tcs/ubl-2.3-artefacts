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
in the creation of the UBL 2.3 deliveries. 

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
- UBL-Documents-Google.ods
- UBL-Library-Google.ods
- UBL-Signature-Google.ods

Each revision is described by the following configuration files:
- target identification when converting ODS to genericode
  - `ident-UBL.xml` 
  - `ident-UBL-Signature.xml`
- XSD and JSON schema configuration
  - `config-UBL.xml`
  - `config-UBL-Signature.xml`
- shell wrapper for generated CVA Schematron pattern
  - `UBL-DefaultDTQ-shell.sch`
- spell-check word list (each line is a word not in the dictionary that is allowed to be in UBL, including misspellings from previous versions of UBL that cannot be repaired due to backward compatibility)
  - `spellcheck-UBL.txt`

Installed software requirements invoked from Ant script using `exec`:
- `soffice` - LibreOffice, OpenOffice, or equivalent
- `aspell` - spell checker
- `sh`, `tee`, `wc`, `grep` - typical POSIX applications

Comparisons to old versions of UBL are generated as DocBook files for inclusion in the hub document. These old versions are the final genericode models for the particular version being compared. So, for UBL 2.3 csprd03 the comparisons are to:
- `UBL-Entities-2.3-csprd02.gc`
- `UBL-Signature-Entities-2.3-csprd02.gc`
- `UBL-Entities-2.2.gc`
- `UBL-Signature-Entities-2.2.gc`

Outputs:
- summary use of words in Dictionary Entry Names (each line is the word followed by the version of UBL in which the word is used)
  - `wordlist-UBL.txt`
- conversion of ODS

The build process is:
- `sh produceUBLSchemas-2.3.sh ../results stage label`
  - pre-existing target directory (without trailing "/")
  - stage (e.g. "csd02wd03", "csprd01", "os", etc.)
  - label (e.g. "CCYYMMDD-hhmmz" UTC time as in "20200406-0250z", or any string for testing purposes)

## Contact

Please send questions or comments about 
[OASIS TC GitHub repositories](https://www.oasis-open.org/resources/tcadmin/github-repositories-for-oasis-tc-members-chartered-work) 
to the [OASIS TC Administrator](mailto:tc-admin@oasis-open.org).  For questions about content in this 
repository, please contact the TC Chair or Co-Chairs as listed on the the UBL TC's 
[home page](https://www.oasis-open.org/committees/ubl/).
