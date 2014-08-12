# awk progfile to form an .html table from a .csv file (called by csv_to_html_converter.bat)
BEGIN{print "<table>" }
# for first line:
NR==1{printf "<tr><th>";gsub(",","<\/th><th>");printf($0);print "</th></tr>"}
# for all following lines:
NR!=1{printf "<tr><td>";gsub(",","<\/td><td>");printf($0);print "</td></tr>"}
END{print "<\/table>"}
