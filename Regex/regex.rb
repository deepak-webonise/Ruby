#/usr/bin/ruby -w
#Html scraping
file_html = File.open("states.html", "r")
file_csv = File.open("states.csv", "w")
html_content = file_html.readlines
html_content.each{
  |line| match = (line).scan(/(?<=<th>)(?<word>(\w)*(\s\w+)*)(?=<\/th>)/)
  if(match.length > 0)
   file_csv.puts(match.join(";"))
  end
  match = (line).scan(/(?<=<td>)(?<word>(\w)*(\s\w+)*)(?=<\/td>)/)
  if(match.length > 0)
   file_csv.puts(match.join(";"))
  end  
}

