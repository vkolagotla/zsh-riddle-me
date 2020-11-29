# zsh-riddle-me

Custom [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh)  plugin to generate random Riddles.

## How to use?

1. Clone the repo into your custom plugins folder, usually at ($HOME/.oh-my-zsh/custom/plugins/)

   ```shell
   git clone https://gitlab.com/vkolagotla/zsh-riddle-me.git ~/.oh-my-zsh/custom/plugins/zsh-riddle-me
   ```

2. Add `zsh-riddle-me` to .zshrc plugin list, usually at (~/.zshrc)

   ```zsh
   plugins=(... zsh-riddle-me)
   ```

3. Source .zshrc file

   ```bash
   source ~/.zshrc
   ```

4. Type `riddle-me` in your terminal and enjoy the riddles

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

## About LICENSE

I created this plugin for personal use. The plugin [LICENSE](LICENSE) is only valid for the code. Since the riddles are fetched from an external source(online), i do not own that data. I would suggest you to not use the plugin for any commercial purpose, unless you have the permission to do so from those respective data sources.

[Go UP⬆️](#zsh-riddle-me)