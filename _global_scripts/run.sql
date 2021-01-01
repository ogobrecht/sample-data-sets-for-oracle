/*

Run
---

The purpose of this script is to call other SQL scripts and to have at the same
time the called file as a list item for a deployment log. This is also useful
when the called file contains code of a function or package and the code can
begin in line one instead of line two or later because of the saved prompt line
for the deployment log. Compiling errors refer then to the correct lines in the
source files.

*/

prompt - run &1
@&1
