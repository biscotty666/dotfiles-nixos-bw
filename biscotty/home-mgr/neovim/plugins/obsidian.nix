{ lib, ... }: {
  programs.nixvim.plugins.obsidian = {
    enable = true;
    settings = {
      completion = {
        min_chars = 2;
        nvim_cmp = true;
      };
      workspaces = [
        {
          name = "home";
          path = "~/Obsidian/Brian2";
        }
      ];
      notes_subdir = "Notes";
      new_notes_location = "notes_subdir";
      daily_notes = {
    #-- Optional, if you keep daily notes in a separate directory.
        folder = "Notes/Daily";
    #-- Optional, if you want to change the date format for the ID of daily notes.
        date_format = "%b %d, %Y";
    #-- Optional, if you want to change the date format of the default alias of daily notes.
        alias_format = "%B %-d, %Y";
    #-- Optional, default tags to add to each new daily note created.
        #default_tags = { "daily-notes" };
                    #-- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
        template = "Daily Note";
    };
    preferred_link_style = "wiki";
      disable_frontmatter=false;
      attachments = {
        img_folder = "Extras/Images";
      };
      templates = {
        subdir = "~/Obsidian/Brian2/Templates";
        substitutions = {
          monday.__raw = ''
            function()
                -- Get the current date
                local currentDate = os.date("*t")

                -- Calculate the difference in days to the first day of the week (Monday)
                local diff = (currentDate.wday + 5) % 7

                -- Subtract the difference to get the date of the first day of the week
                currentDate.day = currentDate.day - diff

                -- Return the date of the first day of the week
                return os.date("%Y-%m-%d", os.time(currentDate))
            end
          '';
          tuesday.__raw = ''
            function()
                -- Get the current date
                local currentDate = os.date("*t")

                -- Calculate the difference in days to the first day of the week (Monday)
                local diff = (currentDate.wday + 4) % 7

                -- Subtract the difference to get the date of the first day of the week
                currentDate.day = currentDate.day - diff

                -- Return the date of the first day of the week
                return os.date("%Y-%m-%d", os.time(currentDate))
            end
          '';
          wednesday.__raw = ''
            function()
                -- Get the current date
                local currentDate = os.date("*t")

                -- Calculate the difference in days to the first day of the week (Monday)
                local diff = (currentDate.wday + 3) % 7

                -- Subtract the difference to get the date of the first day of the week
                currentDate.day = currentDate.day - diff

                -- Return the date of the first day of the week
                return os.date("%Y-%m-%d", os.time(currentDate))
            end
          '';
          thursday.__raw = ''
            function()
                -- Get the current date
                local currentDate = os.date("*t")

                -- Calculate the difference in days to the first day of the week (Monday)
                local diff = (currentDate.wday + 2) % 7

                -- Subtract the difference to get the date of the first day of the week
                currentDate.day = currentDate.day - diff

                -- Return the date of the first day of the week
                return os.date("%Y-%m-%d", os.time(currentDate))
            end
          '';
          friday.__raw = ''
            function()
                -- Get the current date
                local currentDate = os.date("*t")

                -- Calculate the difference in days to the first day of the week (Monday)
                local diff = (currentDate.wday + 1) % 7

                -- Subtract the difference to get the date of the first day of the week
                currentDate.day = currentDate.day - diff

                -- Return the date of the first day of the week
                return os.date("%Y-%m-%d", os.time(currentDate))
            end
          '';
        };
      };
    };
  };
}
