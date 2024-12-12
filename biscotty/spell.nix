let
nvim-spell-fr-utf8-dictionary = builtins.fetchurl {
  url = "https://ftp.nluug.nl/vim/runtime/spell/fr.utf-8.spl";
  sha256 = "abfb9702b98d887c175ace58f1ab39733dc08d03b674d914f56344ef86e63b61";
};

nvim-spell-es-utf8-dictionary = builtins.fetchurl {
  url = "https://ftp.nluug.nl/vim/runtime/spell/es.utf-8.spl";
  sha256 = "1qvv6sp4d25p1542vk0xf6argimlss9c7yh7y8dsby2wjan3fdln";
};

nvim-spell-fr-utf8-suggestions = builtins.fetchurl {
  url = "https://ftp.nluug.nl/vim/runtime/spell/fr.utf-8.sug";
  sha256 = "0294bc32b42c90bbb286a89e23ca3773b7ef50eff1ab523b1513d6a25c6b3f58";
};

nvim-spell-fr-latin1-dictionary = builtins.fetchurl {
  url = "https://ftp.nluug.nl/vim/runtime/spell/fr.latin1.spl";
  sha256 = "086ccda0891594c93eab143aa83ffbbd25d013c1b82866bbb48bb1cb788cc2ff";
};

nvim-spell-fr-latin1-suggestions = builtins.fetchurl {
  url = "https://ftp.nluug.nl/vim/runtime/spell/fr.latin1.sug";
  sha256 = "5cb2c97901b9ca81bf765532099c0329e2223c139baa764058822debd2e0d22a";
};

nvim-spell-es-utf8-suggestions = builtins.fetchurl {
  url = "https://ftp.nluug.nl/vim/runtime/spell/es.utf-8.sug";
  sha256 = "0v5x05438r8aym2lclvndmjbshsfzzxjhqq80pljlg35m9w383z7";
};

nvim-spell-es-latin1-dictionary = builtins.fetchurl {
  url = "https://ftp.nluug.nl/vim/runtime/spell/es.latin1.spl";
  sha256 = "0h8lhir0yk2zcs8rjn2xdsj2y533kdz7aramsnv0syaw1y82mhq7";
};

nvim-spell-es-latin1-suggestions = builtins.fetchurl {
  url = "https://ftp.nluug.nl/vim/runtime/spell/es.latin1.sug";
  sha256 = "0jryzc3l1n4yfrf43cx188h0xmk5qfpzc4dqnxn627dx57gn799b";
};
in
{
  xdg.configFile."nvim/spell/fr.utf-8.spl".source = nvim-spell-fr-utf8-dictionary;
  xdg.configFile."nvim/spell/es.utf-8.spl".source = nvim-spell-es-utf8-dictionary;
  xdg.configFile."nvim/spell/fr.utf-8.sug".source = nvim-spell-fr-utf8-suggestions;
  xdg.configFile."nvim/spell/fr.latin1.spl".source = nvim-spell-fr-latin1-dictionary;
  xdg.configFile."nvim/spell/fr.latin1.sug".source = nvim-spell-fr-latin1-suggestions;
  xdg.configFile."nvim/spell/es.utf-8.sug".source = nvim-spell-es-utf8-suggestions;
  xdg.configFile."nvim/spell/es.latin1.spl".source = nvim-spell-es-latin1-dictionary;
  xdg.configFile."nvim/spell/es.latin1.sug".source = nvim-spell-es-latin1-suggestions;
}
