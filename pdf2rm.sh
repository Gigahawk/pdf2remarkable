#!/usr/bin/env bash

set -e

SOURCE_DIR=/home/root/pdf2remarkable
XOCHITL_DIR=/home/root/.local/share/remarkable/xochitl

function import_pdf() {
    local pdf="$@"
    echo "Importing $pdf into xochitl"
    # needs full path when called by systemd
    uuid=$(/opt/bin/uuidgen)
    target_pdf="${XOCHITL_DIR}/${uuid}.pdf"
    target_meta="${XOCHITL_DIR}/${uuid}.metadata"
    target_content="${XOCHITL_DIR}/${uuid}.content"

    echo "Moving to $target_pdf"
    mv "$pdf" "$target_pdf"
    chmod 600 "$target_pdf"
    echo "Writing metadata to $target_meta"
    cat << EOF > "$target_meta"
{
    "deleted": false,
    "lastModified": "$(date +%s000)",
    "metadatamodified": true,
    "modified": true,
    "parent": "",
    "pinned": false,
    "synced": false,
    "type": "DocumentType",
    "version": 0,
    "visibleName": "$(basename "$pdf")"
}
EOF
    echo "$(cat "$target_meta")"
    echo "Writing content to $target_content"
    cat << EOF > "$target_content"
{
    "fileType": "pdf"
}
EOF
    echo "$(cat "$target_content")"
}

for f in "$SOURCE_DIR"/*.[pP][dD][fF]
do
    if [ -f "$f" ];then
        import_pdf "$f"
    fi
done

echo "Restart xochitl to imported PDFs"



