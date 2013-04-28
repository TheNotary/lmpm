# Linux Mint Post-install Manager (lmpm aka 'limpim')

This gem allows you to easily configure LinuxMint in pre-set configurations that are easy to share online via github.com

## Details

The gem, lmpm, will read a configuration script, and then customize Linux Mint accordingly.  
	* It has the ability to change .js files.  
	* It will have the ability to revert the configuration back to what it was before.  
	* It will handle dconf editing too.  
	* It will even allow you to specify wallpaper.  

## Installation/ Usage

Lmpm can be installed two ways:
	
1)  Install the gem using gem (ruby must be installed already for this method).:

    $  gem install lmpm
    $  lmpm configure https://www.github.com/TheNotary/TheNotarys_linux_mint_postinstall_configuration

2)  lmpm can be installed automatically (along with ruby and many other dependencies) using the bash script stored in a related github repo.  

    $ curl bash trick   TODO write this! 
    $  https://github.com/TheNotary/lmpm-installer

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


Also, learn how to create your own scripts.  Maybe I'll build a script search engine *eyes widen in excitement*!
