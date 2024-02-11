#!/bin/bash

set -eu -o pipefail

#!/bin/bash

set -eu -o pipefail

for file in *; do
	output="$(sed --expression 's|[^A-Za-z0-9._-]|-|g' <<<"$file" | # idk what this does tbh
		tr '[:upper:]' '[:lower:]' |
		sed --expression 's|_|-|g' --expression 's|\(-\)\1|\1|g')" # replace underscore with dashes

	if [ "$file" != "$output" ]; then
		echo "filename changed for "$file" in "$output""
		# mv "${file}" ${output}
	fi
done
