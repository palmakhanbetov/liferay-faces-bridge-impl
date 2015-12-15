<!--
    Licensed to the Apache Software Foundation (ASF) under one
    or more contributor license agreements.  See the NOTICE file
    distributed with this work for additional information
    regarding copyright ownership.  The ASF licenses this file
    to you under the Apache License, Version 2.0 (the
    "License"); you may not use this file except in compliance
    with the License.  You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.	   
-->
<!--
  Applied in the maven test targets to one portlet definition 
  file at a time to build a java properties file with one 
  entry for each portlet definition.
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pa="http://java.sun.com/xml/ns/portlet/portlet-app_2_0.xsd">
  <xsl:output method="xml" indent="yes" doctype-system="http://java.sun.com/dtd/properties.dtd"/> 
  <xsl:strip-space elements="pa:portlet-app"/>
  <xsl:param name="page-path"/>
  <xsl:template match="/">
    <xsl:element name="properties">
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>
  <xsl:template match="pa:portlet-app/pa:portlet">
    <xsl:element name="entry">
      <xsl:attribute name="key"><xsl:value-of select='$page-path'/><xsl:value-of select="pa:portlet-name"/></xsl:attribute>
      <xsl:value-of select="substring-before(substring-after(pa:portlet-name,'-'),'-')"/>
    </xsl:element>
  </xsl:template>
</xsl:stylesheet>
