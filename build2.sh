#! /bin/sh

java -jar validation/saxon9he.jar -s:texts/xml  -o:texts/edition-translation -xsl:project-documentation/stylesheets/inscriptions/start-edition-with-bibl.xsl
