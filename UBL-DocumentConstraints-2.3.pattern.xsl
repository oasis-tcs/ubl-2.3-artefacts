<?xml version="1.0" encoding="utf-8"?>
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="UBL-DocumentConstraints-2.3"
         xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xsl:version="2.0">
<!--
UBL 2.3 Additional Document Constraints
  
2020-04-18 14:50(UTC)

A set of Schematron rules against which UBL 2.3 document constraints are
tested where in the scope of a second pass validation after schema validation
has been performed.

Required namespace declarations as indicated in this set of rules:

<ns prefix="ext" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"/>
<ns prefix="cbc" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"/>

The following is a summary of the additional document constraints enumerated
in UBL 2.3:

[IND1] All UBL instance documents SHALL validate to a corresponding schema.

 - this is tested in the first pass by schema validation, not in the second
   pass with Schematron validation

[IND2] All UBL instance documents SHALL identify their character encoding
       within the XML declaration.

 - this cannot be tested using Schematron as the information is not part of
   XDM (the XML Data Model)

[IND3] In conformance with ISO IEC ITU UN/CEFACT eBusiness Memorandum of
       Understanding Management Group (MOUMG) Resolution 01/08 (MOU/MG01n83)
       as agreed to by OASIS, all UBL XML SHOULD be expressed using UTF-8.

 - this cannot be tested using Schematron as the information is not part of
   XDM (the XML Data Model)

[IND4] (This archaic test no longer exists)

[IND5] UBL-conforming instance documents SHALL NOT contain an element devoid of content or containing null values.

 - implemented below
 - per the documentation, this does not apply to the arbitrary content of
   an extension

[IND6] The absence of a construct or data in a UBL instance document SHALL NOT carry meaning.

 - this cannot be tested using Schematron as it is an application constraint
   on the interpretation of the document

[IND7] Where two or more sibling “Text. Type” elements of the same name exist in a document, no two can have the same “languageID” attribute value.

 - implemented below

[IND8] Where two or more sibling “Text. Type” elements of the same name exist in a document, no two can omit the “languageID” attribute.

 - implemented below

[IND9] UBL-conforming instance documents SHALL NOT contain an attribute devoid of content or containing null values.

 - implemented below
 - per the documentation, this does not apply to the arbitrary content of
   an extension

-->
   <rule id="Extensions-IND5-IND9" 
         context="ext:ExtensionContent//*[not(*) and not(normalize-space(.))] |
                  ext:ExtensionContent//@*[not(normalize-space(.))]">
      <!--Empty elements and attributes allowed in extension content-->
   </rule>
   <rule context="*[not(*) and not(normalize-space(.))]">
      <report id="IND5" test="true()">[IND5] Elements SHALL NOT be empty</report>
   </rule>
   <rule context="@*[not(normalize-space(.))]">
      <report id="IND9" test="true()">[IND9] Attributes SHALL NOT be empty</report>
   </rule>
   <rule context="{string-join( distinct-values( for $row in 
   /*/SimpleCodeList/Row[Value[@ColumnRef='DataType']/SimpleValue='Text. Type']
                        [Value[@ColumnRef='Cardinality']/ends-with(SimpleValue,'n')]
   return concat('cbc:',$row/Value[@ColumnRef='ComponentName']/SimpleValue,'[1]') ),' | ')}">
     <report id="IND7"
             test="@languageID and
                   following-sibling::*[name(.)=name(current())][@languageID=current()/@languageID]"
       >[IND7] Two or more sibling "Text.Type" cannot both have the same "languageID" attribute value.
     </report>
     <report id="IND8"
             test="not(@languageID) and
                   following-sibling::*[name(.)=name(current())][not(@languageID)]"
       >[IND8] Two or more sibling "Text.Type" cannot both omit the "languageID" attribute.
     </report>
   </rule>
</pattern>