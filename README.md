# Practicum-II

## General Approach:
As of right now I think the general approach to fully automate this process is the following:
1. Get names from query "Distinct package names"
2. Get raw XML per package (will be downloaded nightly)
3. Read through XML grabbing live connections (under Connections header in Python) as well as "DTS:From" and "DTS:To" to capture joins created in gui
4. Use connections and GUIDs to filter main table

Right now I'm testing this approach using only the Master Common.dtsx file

Update: Testing is complete and successful.  Future builds will be generalized based on this approach.

## Python:
There are several snippets here, but only two in production (the first of which requires more development)
1. Grabs fields "DTS:From" and "DTS:To" and converts it into a dataframe after filtering out several results
2. Grabs live connections for packages at the "table" level

Note: Comments in each code snippet gives purpose and general flow of each snippet

These all together give me all the filtering I need for my large catalog/internal tables returned in the SQL queries

## SQL:
There are three files here so far.
1. Distinct package names is a simple "Select Distinct..." query to give me a full list of working packages
2. Connection strings is an example of filtering using GUID and package name
3. filtered results is the (mostly) completed table that needs some filtering from the results of Python parsing XML

Note: I ended up not using these to build the table.  More detail in report

## XML:
Contains the twp raw XML files I'm using for testing/building
1. Master Common ETL.xml - this is a large file that is reused in the ETL for several of our core packages.  It contains logic for the ETL of ~20 "sub-packages" at the table level
2. Staging_PS_CF_ATTRIB_TBL.xml - is a sample of a table level package

## Screenshots:
Contains two jpg.  One of raw XML and one of the behavior the XML captures that is displayed with VS gui.  The logic captured here is the purpose behind the "LogicalAnd" snippet.  Future development will be able to capture this.
