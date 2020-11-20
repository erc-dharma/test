#! /bin/sh

java -jar validation/saxon9he.jar -s:texts/xml  -o:texts/xml -xsl:project-documentation/stylesheets/inscriptions/start-edition-with-bibl.xsl
