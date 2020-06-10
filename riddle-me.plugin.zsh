# custom zsh plugin for random riddles

function riddle-me {

    TXT=$(curl -s --connect-timeout 2 "https://goodriddlesnow.com/riddles/random" | iconv -c -f ISO-8859-1 -t UTF-8 | grep "<p><strong>")

    TXT_R=${TXT#*'<p><strong>Question: </strong>'}
    R=${TXT_R%'?</p></div'*}
    R=${R%'</p></div'*}
    R=${R%' </p></div'*}
    R=${R%'.</p></div'*}
    R=$(echo "$R" | sed -e 's/<\/br\>.*//g')

    TXT_A=${TXT_R#*'<p><strong>Answer: </strong>'}
    A=${TXT_A%'</p><div '*}

    print -P "Riddle: %F{1}${R}??%f"
    echo -n "Enter 'A/a' to see the Answer or enter your Answer: "
    read input
    echo "You entered: $input"

    if [ $input = "A" ] || [ $input = "a" ]; then
        print -P "And the answer is: %F{2}${A}%f"
    else
        echo -n "Do you want to see the answer now?(y/n): "
        read user_ans
        if [ $user_ans = "y" ]; then
            print -P "And the answer is: %F{2}${A}%f"
        elif [ $user_ans = "n" ]; then
            echo -n "Take your time and at the end type something to see the answer..."
            read something
            print -P "And the answer is: %F{2}${A}%f"
        else
            print -P "And the answer is: %F{2}${A}%f"
        fi
    fi
}
