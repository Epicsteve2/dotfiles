#!/usr/bin/env bash
#find . -type f | grep -i jpg$ | xargs cp {} /media/stephen/Steve64gb/
#find . -type f -name '*.jpg' -exec cp '{}' /media/stephen/Steve64gb/'{}' ';'

SRC="${HOME}/Videos"
#DST="/media/${LOGNAME}/Steve64gb/screenshots"
DST="/home/stephen/Desktop/junk"

# DSTLIST=()
# for FILE in "$DST"/*; do
# 	DSTLIST+=("`basename -- "${FILE}"`")
# done

# for file in "${DSTLIST[@]}"; do
# 	echo $file
# done

# printf '%s\n' "${DSTLIST[@]}"


IMAGELIST=`find "${SRC}" -type f -name '*.kdenlive'`
# echo "${IMAGELIST}"
while IFR= read -r IMAGE; do # reads list of images
	NEWIMAGE=`echo "${IMAGE}" | tr : \;` # Remove illegal characters
	NEWIMAGE=`basename "${NEWIMAGE}"` # Just get image name
	if ! [[ -e ${DST}/${NEWIMAGE} ]]; then
		cp -v "${IMAGE}" "${DST}/${NEWIMAGE}"
	fi
	#cp -v "${IMAGE}" "${DST}/${NEWIMAGE}"
done <<< "${IMAGELIST}" # Finds all matching files, then insert at while loop

exit

while IFR= read -r IMAGE; do # reads list of images
	NEWIMAGE=`echo "${IMAGE}" | tr : \;` # Remove illegal characters
	NEWIMAGE=`basename "${NEWIMAGE}"` # Just get image name
	cp -v "${IMAGE}" "${DST}/${NEWIMAGE}"
done <<< "${IMAGELIST}" # Finds all matching files, then insert at while loop