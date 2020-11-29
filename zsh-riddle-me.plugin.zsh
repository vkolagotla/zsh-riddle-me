# custom zsh plugin for random riddles

function riddle-me {

    TXT=$(curl -s --connect-timeout 2 "https://goodriddlesnow.com/riddles/random" | iconv -c -f ISO-8859-1 -t UTF-8 | grep "<p><strong>")
    
    # formatted riddle
    TXT_R=${TXT#*'<p><strong>Question: </strong>'}
    R=${TXT_R%'><ul class="inline-list print-hide">'*}
    R=$(echo "$R" | sed -e 's/<[^>]*>//g' | sed -e 's|?</div||g' | sed -e 's|</div||g')
    
    # formatted answer
    TXT_A=${TXT_R#*'<p><strong>Answer: </strong>'}
    A=${TXT_A%'</p><div '*}
    A=$(echo "$A" | sed -e 's/<[^>]*>//g')
    
    # hint (number of words)
    H=$(echo $A | wc -w)

    print -P "Riddle: %F{1}${R}??%f"
    echo -n "Enter 'A/h' to see the Answer/Hint or enter your Answer: "
    read input
    echo "You entered: $input"

    case $input in
        [Aa])
            print -P "And the answer is: %F{2}${A}%f"
        ;;
        [Hh])
            if [[ $H -eq 2 ]] && [[ $A =~ ^"A"||"An"||"The" ]]; then
                echo -n "Hint: The answer has $H words in it and one of them is probably an article (A, An, The)...\n"
            else
                echo -n "Hint: The answer has $H words in it... \n"
            fi
            echo -n "Do you want to see the answer now?(Y/n): "
            read user_ans
            case $user_ans in
            [Yy])
                print -P "And the answer is: %F{2}${A}%f"
            ;;
            [Nn])
                echo -n "Take your time and at the end type something to see the answer... "
                read something
                echo "You entered: $something"
                print -P "And the answer is: %F{2}${A}%f"
            ;;
            *)
                print -P "And the answer is: %F{2}${A}%f"
            ;;
            esac
        ;;
        *)
            print -P "The Answer is: %F{2}${A}%f"
        ;;
    esac
}
