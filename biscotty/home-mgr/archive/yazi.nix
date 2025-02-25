{pkgs, ...}: let
	plugins-repo = pkgs.fetchFromGitHub {
		owner = "yazi-rs";
		repo = "plugins";
 		rev = "3783ea0feb98842c09bd6eb75c06f8ab814050e2";
 		hash = "sha256-otOGaTg4DQaTnpezkAVbTq509US/efN0elosUZbzxeU=";
 	};
in {
	programs.yazi = {
		enable = true;
		enableZshIntegration = true;
		shellWrapperName = "y";

		settings = {
			manager = {
				show_hidden = true;
			};
			preview = {
				max_width = 1000;
				max_height = 1000;
			};
			#open.append_rules = {
				#name = "*.jpg"; use = [ "open" "edit" "gimp"];
			#};
		};

 	plugins = {
 		chmod = "${plugins-repo}/chmod.yazi";
 		full-border = "${plugins-repo}/full-border.yazi";
 		max-preview = "${plugins-repo}/max-preview.yazi";
 		starship = pkgs.fetchFromGitHub {
 			owner = "Rolv-Apneseth";
 			repo = "starship.yazi";
 			rev = "6197e4cca4caed0121654079151632f6abcdcae9";
 			sha256 = "sha256-oHoBq7BESjGeKsaBnDt0TXV78ggGCdYndLpcwwQ8Zts=";
 		};
 	};

	  #require("full-border"):setup()
	initLua = ''
		require("starship"):setup()
	'';

		keymap = {
			manager.prepend_keymap = [
				{
					on = ["T"];
					run = "plugin --sync max-preview";
					desc = "Maximize or restore the preview pane";
				}
				{
					on = ["c" "m"];
					run = "plugin chmod";
					desc = "Chmod on selected files";
				}
			];
		};
	};
}
