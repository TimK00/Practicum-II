# Practicum-II

The layout of this repo is a work in progress.
Currently contains all code used for tracing data/testing.
As project continues to take shape folders may be renamed.

## General Approach:
As of right now I think the general approach to fully automate this process is the following:
1. Get names from query "Distinct package names"
2. Get raw XML per package (probably already downloaded to a folder on work server - need to study more on how to download these every night)
3. Read through XML grabbing live connections (under Connections header in XML) as well as "DTS:From" and "DTS:To" to capture joins created in gui
4. Use connections and GUIDs to filter main table

Right now I'm testing this approach using only the Master Common.dtsx file

## Python:
I've completed this section.  I have four helper snippets to grab some useful things from the XML.
1. Grabs fields "DTS:From" and "DTS:To" and converts it into a dataframe after filtering out several results
2. Same as above with less filtering
3. Grabs package names and GUIDs for future filtering
4. Grabs live connections for packages at the "table" level

These all together give me all the filtering I need for my large catalog/internal tables returned in the SQL queries

## SQL:
There are three files here so far.
1. Distinct package names is a simple "Select Distinct..." query to give me a full list of working packages
2. Connection strings is an example of filtering using GUID and package name
3. filtered results is the (mostly) completed table that needs some filtering from the results of Python parsing XML

## XML:
Contains the twp raw XML files I'm using for testing/building

## Screenshots:
Contains two jpg.  One of raw XML and one of the behavior the XML captures that is displayed with VS gui
