#!/usr/bin/env bash

# The following comments should help you get started:
# - Bash is flexible. You may use functions or write a "raw" script.
#
# - Complex code can be made easier to read by breaking it up
#   into functions, however this is sometimes overkill in bash.
#
# - You can find links about good style and other resources
#   for Bash in './README.md'. It came with this exercise.
#
#   Example:
#   # other functions here
#   # ...
#   # ...
#
#   main () {
#     # your main function code here
#   }
#
#   # call main with all of the positional arguments
#   main "$@"
#
# *** PLEASE REMOVE THESE COMMENTS BEFORE SUBMITTING YOUR SOLUTION ***

main() {
    local score=$1
    local action=$2
    local item=$3
    
    # Define allergens in order (index matches bit position)
    local allergens=(eggs peanuts shellfish strawberries tomatoes chocolate pollen cats)
    local results=()

    # Determine which allergies are present
    for i in "${!allergens[@]}"; do
        # Use bitwise AND to check if the bit for this index is set
        if (( (score >> i) & 1 )); then
            results+=("${allergens[i]}")
        fi
    done

    case "$action" in
        "list")
            echo "${results[*]}"
            ;;
        "allergic_to")
            # Check if the specific item is in our results array
            for allergy in "${results[@]}"; do
                if [[ "$allergy" == "$item" ]]; then
                    echo "true"
                    return
                fi
            done
            echo "false"
            ;;
    esac
}

main "$@"
