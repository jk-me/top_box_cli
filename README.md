# TopBox

This is a Ruby CLI command-line interface application that allows the user to view summaries and critic reviews of current top box office films. Data provided by imdb.com.

## Requirements

This app was built on ruby 2.3.3.

## Usage

For gem installation: ($ signals a terminal command)

This will install the gem in your environment, then use irb (the interactive ruby shell) to activate a new instance of the CLI application.
  ```
  $gem install 'top_box'
  $irb
  $require 'top_box'
  $TopBox::CLI.new.call
  ```

For locally cloned repositories, initialize application with command below, then follow on screen prompts.

    $ bin/top_box
    
## Author

* **Jenny Kam**
 [jk-me](https://github.com/jk-me)
* **Blog:** [TopBox App](https://jk-me.github.io/top_box_cli)
* **Blog:** [Publishing a Ruby Gem](https://jk-me.github.io/ruby_cli_gem_-_live_version)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'jk-me'/top_box. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The app is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the TopBox project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/'jk-me'/top_box/blob/master/CODE_OF_CONDUCT.md).
