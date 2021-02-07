chmod +x ./lua-format
IFS=$'\n'; set -f
for f in $(find . -name "*.lua"); do "./lua-format" -v -i $f; done
unset IFS; set +f
