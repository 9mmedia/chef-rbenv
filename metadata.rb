maintainer       "Fletcher Nichol"
maintainer_email "fnichol@nichol.ca"
license          "Apache 2.0"
description      "Manages rbenv and its installed rubies. Several LWRPs are also defined."
long_description "Please refer to README.md (it's long)."
version          "0.6.11"

recommends "ruby_build"       # if using the rbenv_ruby LWRP, ruby-build must be installed
recommends "java", "> 1.4.0"  # if using jruby, java is required on system

supports "ubuntu"
supports "debian"
supports "freebsd"
supports "redhat"
supports "centos"
supports "fedora"
supports "amazon"
supports "scientific"
supports "suse"
supports "mac_os_x"

recipe "rbenv", "Installs the rbenv gem and initializes Chef to use the Lightweight Resources and Providers (LWRPs). Use this recipe explicitly if you only want access to the LWRPs provided."
recipe "system_install", "Installs the rbenv codebase system-wide (that is, into /usr/local/rbenv). This recipe includes default. Use this recipe by itself if you want rbenv installed system-wide but want to handle installing Rubies, invoking LWRPs, etc."
recipe "system", "Installs the rbenv codebase system-wide (that is, into /usr/local/rbenv) and installs rubies driven off attribute metadata. This recipe includes default and system_install. Use this recipe by itself if you want rbenv installed system-wide with rubies installed."
recipe "user_install", "Installs the rbenv codebase for a list of users (selected from the node['rbenv']['user_installs'] hash). This recipe includes default. Use this recipe by itself if you want rbenv installed for specific users in isolation but want each user to handle installing Rubies, invoking LWRPs, etc."
recipe "user", "Installs the rbenv codebase for a list of users (selected from the node['rbenv']['user_installs'] hash) and installs rubies driven off attribte metadata. This recipe includes default and user_install. Use this recipe by itself if you want rbenv installed for specific users in isolation with rubies installed."

attribute "rbenv",
  :display_name => "rbenv hash",
  :description => "Hash of rbenv attributes.",
  :type => "hash"

attribute "rbenv/git_url",
  :display_name => "git_url",
  :description => "The Git URL which is used to install rbenv.",
  :default => "git://github.com/sstephenson/rbenv.git"

attribute "rbenv/git_ref",
  :display_name => "git_ref",
  :description => "A specific Git branch/tag/reference to use when installing rbenv. For example, to pin rbenv to a specific release",
  :default => "master"

attribute "rbenv/upgrade",
  :display_name => "upgrade",
  :description => "Determines how to handle installing updates to the rbenv. There are currently 2 valid values: none or sync.",
  :default => "none"

attribute "rbenv/root_path",
  :display_name => "root_path",
  :description => "The path prefix to rbenv in a system-wide installation.",
  :default => "/usr/local/rbenv"

attribute "rbenv/rubies",
  :display_name => "rubies",
  :description => "A list of additional system-wide rubies to be built and installed using the ruby_build cookbook. You must include recipe[ruby_build] in your run_list for the rbenv_ruby LWRP to work properly.",
  :default => "[]"

attribute "rbenv/user_rubies",
  :display_name => "user_rubies",
  :description => "A list of additional system-wide rubies to be built and installed (using the ruby_build cookbook) per-user when not explicitly set.",
  :default => "[]"

attribute "rbenv/gems",
  :display_name => "gems",
  :description => "A hash of gems to be installed into arbitrary rbenv-managed rubies system wide. See the rbenv_gem resource for more details about the options for each gem hash and target Ruby environment.",
  :type => "hash",
  :default => "{}"

attribute "rbenv/user_gems",
  :display_name => "user_gems",
  :description => "A hash of gems to installed into arbitrary rbenv-managed rubies for each user when not explicitly set. See the rbenv_gem resource for more details about the options for each gem hash and target Ruby environment.",
  :type => "hash",
  :default => "{}"
