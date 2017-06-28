cat hello.cobol | awk '{printf "%-80s", $0}' |  iconv -f ISO8859-1 -Tt IBM-1047 > hello.out.cobol
cat hello-cobol.jcl | awk -v PWD="$PWD/hello.out.cobol" '{gsub(/COBOLPATH/,PWD,$0);print $0}' > hello-cobol.out.jcl
submit $PWD/hello-cobol.out.jcl