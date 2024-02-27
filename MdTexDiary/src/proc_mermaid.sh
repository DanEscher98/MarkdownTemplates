#!/bin/bash

MARKDOWN_DIR="$1"
OUTPUT_DIR="tmp"

# Create the output directory if it does not exist
mkdir -p "$OUTPUT_DIR/mermaid"
mkdir -p "$OUTPUT_DIR/img"

function process_mermaid_block() {
    local block="$1"
    local filename="$2"
    local blockname="$3"

    # Get accTitle and accDescr from the block
    local title=$(echo "$block" | grep -o 'accTitle:.*' | sed 's/accTitle://' | tr -d '[:space:]')
    local desc=$(echo "$block" | grep -o 'accDescr:.*' | sed 's/accDescr://' | tr -d '[:space:]')

    # Set default values for title and desc if not found
    title=${title:-""}
    desc=${desc:-"diagram"}

    # Create the mdd file
    local mdd_file="$OUTPUT_DIR/mermaid/$filename.$blockname.mdd"
    echo "$block" > "$mdd_file"

    # Compile the mdd file to png
    local png_file="$OUTPUT_DIR/img/$filename.$blockname.png"
    npx -p @mermaid-js/mermaid-cli mmdc --input "$mdd_file" --output "$png_file" -b transparent -t neutral

    # Replace the code block with the image
    local replacement="![${desc}]($png_file \"$title\")"
    sed -i "0,/\`\`\`mermaid/d; 0,/^\`\`\`/ s//${replacement}/" "$MARKDOWN_DIR/$filename.md"
}

function process_markdown_file() {
    local filename="$1"
    local content=$(cat "$MARKDOWN_DIR/$filename".md)

    # Find all mermaid blocks in the file
    local blocks=$(echo "$content" | awk '/```mermaid/,/```/')

    # Process each block separately
    local i=1
    while read -r block; do
        process_mermaid_block "$block" "$filename" "$i"
        i=$((i+1))
    done <<< "$blocks"
}

# Process all markdown files in the directory
for file in "$MARKDOWN_DIR"/*.md; do
    filename=$(basename "$file" .md)
    process_markdown_file "$filename"
done

