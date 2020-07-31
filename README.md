# riddle-me

Custom ZSH plugin to generate random Riddles.

## How to use?

1. Clone the repo into your custom plugins folder, usually at ($HOME/.oh-my-zsh/custom/plugins/)

   ```
   git clone https://gitlab.com/vkolagotla/riddle-me.git ~/.oh-my-zsh/custom/plugins/riddle-me
   ```

2. Add `riddle-me` to .zshrc plugin list, usually at (~/.zshrc)

   ```zsh
   plugins=(... riddle-me)
   ```

3. Type `riddle-me` in your terminal

   ```bash
   riddle-me
   ```

**Sample output**

![Sample output](static/riddle-me.png)

## TODO

- [ ] Fix random HTML elements occurrence in text.
- [ ] Cleaver use of `sed` to filter the riddle text.
- [ ] Update hints.

## Source of riddles

* https://goodriddlesnow.com/riddles/random