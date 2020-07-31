# custom zsh plugin for random riddles

function riddle-me {

    TXT=$(curl -s --connect-timeout 2 "https://goodriddlesnow.com/riddles/random" | iconv -c -f ISO-8859-1 -t UTF-8 | grep "<p><strong>")

    TXT_R=${TXT#*'<p><strong>Question: </strong>'}
    R=${TXT_R%'?</p></div'*}
    R=${R%'</p></div'*}
    R=${R%' </p></div'*}
    R=${R%'.</p></div'*}
    # formatted riddle
    R=$(echo "$R" | sed -e 's|<br/>||g')
    # formatted answer
    TXT_A=${TXT_R#*'<p><strong>Answer: </strong>'}
    A=${TXT_A%'</p><div '*}
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
            echo -n "Hint: The answer has $H words in it...\n"
            echo -n "Do you want to see the answer now?(Y/n): "
            read user_ans
            if [ $user_ans = "y" ] || [ $user_ans = "Y" ]; then
                print -P "And the answer is: %F{2}${A}%f"
            elif [ $user_ans = "n" ] || [ $user_ans = "N" ]; then
                echo -n "Take your time and at the end type something to see the answer..."
                read something
                print -P "And the answer is: %F{2}${A}%f"
            else
                print -P "And the answer is: %F{2}${A}%f"
            fi
        ;;
    esac
}
